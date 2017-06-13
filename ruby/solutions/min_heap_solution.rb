# Enter your code here. Read input from STDIN. Print output to STDOUT

input = STDIN.read.split(" ")

class Heap
    attr_reader :input 
    
    def initialize(input)
        @input = input
        @heap = []
    end
    
    def execute
        i = 1
        while i < input.length
            if input[i] === "1"
                add(input[i + 1].to_i)
                i += 2
            elsif input[i] === "2"
                delete(input[i + 1].to_i)
                i += 2
            else
                print_min
                i += 1
            end
        end
    end

    def add(num)
        @heap << num
        heapify_up
    end
    
    def heapify_up(idx = -1)
        parent_idx = find_parent(idx)
        return if parent_idx < 0 || @heap[idx] > @heap[parent_idx]
        
        if @heap[idx] < @heap[parent_idx]
            @heap[idx], @heap[parent_idx] = @heap[parent_idx], @heap[idx]
            heapify_up(parent_idx)
        end
    end
    
    def heapify_down(idx)
        left_idx = find_left_child(idx)
        right_idx = find_right_child(idx)
        return if @heap[left_idx].nil? && @heap[right_idx].nil?
        return if @heap[right_idx].nil? && @heap[idx] < @heap[left_idx]
        return if @heap[right_idx] && @heap[idx] < @heap[left_idx] && @heap[idx] < @heap[right_idx]
        
        
        if @heap[right_idx].nil? || @heap[idx] > @heap[left_idx] && @heap[idx] > @heap[right_idx] 
            if @heap[left_idx] < @heap[right_idx]
                @heap[idx], @heap[left_idx] = @heap[left_idx], @heap[idx]
                heapify_down(left_idx)
            else
                @heap[idx], @heap[right_idx] = @heap[right_idx], @heap[idx]
                heapify_down(right_idx)
            end
        elsif @heap[idx] > @heap[left_idx]
            @heap[idx], @heap[left_idx] = @heap[left_idx], @heap[idx]
            heapify_down(left_idx)
        elsif @heap[idx] > @heap[right_idx]
            @heap[idx], @heap[right_idx] = @heap[right_idx], @heap[idx]
            heapify_down(right_idx)
        end
    end
        
    def delete(num)
        @heap.each_with_index do |el, idx|
            if num == el
                @heap[idx], @heap[-1] = @heap[-1], @heap[idx]
                @heap.pop
                heapify_down(idx)
                break
            end
        end
    end
        
    def find_left_child(idx)
        2 * idx + 1
    end

    def find_right_child(idx)
        2 * idx + 2
    end
        
    def find_parent(idx)
        (idx - 1)/2
    end
        
    def print_min
        puts @heap.first
    end
end

Heap.new(input).execute