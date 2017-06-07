require 'byebug'


def match_less_one(str1, str2)
	i = 0
	diff = 0
	while i < str1.length && i < str2.length
			diff += 1 if str1[i] != str2[i]
			i += 1
	end
	diff == 1
end


$length = 1.0/0.0
$queue = []

def wordLadder(beginWord, endWord, wordList, explored = [beginWord], length = 1)
    if beginWord == endWord
        $length = length if length < $length  
        return
    end

    wordList.each do |word|
        if match_less_one(beginWord, word) && !explored.include?(word)
                $queue << [word, length + 1]
                explored << word
        end
    end

    unless $queue.empty?
        new_target = $queue.shift
        new_word = new_target[0]
        new_length = new_target[1]
        new_list = wordList.reject { |w| w == new_word }
        wordLadder(new_word, endWord, new_list, explored, new_length)
    end
    
    if $length == 1.0/0.0
        return 0
    else
        return $length
    end
end
       

list = 
["si","go","se","cm","so","ph","mt","db","mb","sb","kr","ln","tm","le","av","sm","ar","ci","ca","br","ti","ba","to","ra","fa","yo","ow","sn","ya","cr","po","fe","ho","ma","re","or","rn","au","ur","rh","sr","tc","lt","lo","as","fr","nb","yb","if","pb","ge","th","pm","rb","sh","co","ga","li","ha","hz","no","bi","di","hi","pi","os","uh","wm","an","me","mo","na","la","st","er","sc","ne","qa","mn","mi","am","ex","pt","io","be","fm","ta","tb","ni","mr","pa","he","lr","sq","ye"]
puts wordLadder("qa", "sq", list)