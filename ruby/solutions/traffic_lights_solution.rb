
class TrafficLights
    
  def initialize
    @seconds = 0
    @active = "RED"
    @inactive = "RED"
    @current = "east_west"
  end
  
  def start
    # change to 'while true' to iterate indefinitely
    while @seconds < 100
      @seconds += 1
      sleep 1
      set_status
      print_status
    end
  end
  
  def set_status
      time = @seconds % 13
      if time == 0
        switch
      elsif time.between?(1,8)
        @active = "GREEN"
      elsif time.between?(9,11)
        @active = "YELLOW"
      else
        @active = "RED"
      end
  end
  
  def switch
    @current = @current == "east_west" ? "north_south" : "east_west"
  end
      
  def print_status
    if @current == "east_west"
      puts "East-West traffic light is #{@active}"
      puts "North-South traffic light is #{@inactive}"
    else
      puts "East-West traffic light is #{@inactive}"
      puts "North-South traffic light is #{@active}"
    end
  end
  
end

# TrafficLights.new().start
      




