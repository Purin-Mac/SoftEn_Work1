class Fibonacci

  include Enumerable #included to use reject, map
  
  def initialize(range) 
     @fibonacci_array = Array.new #instance new empty array 
        for i in 0...range do #for loop in range 
	    if @fibonacci_array.length < 2  #if it's 1st and 2nd of array
		@fibonacci_array.push(1)	#push 1 
	    else  
                @fibonacci_array.push(@fibonacci_array[i-1]+@fibonacci_array[i-2]) #if not add 2 previous together and push
	    end             
        end
  end
  
  def each  #essential method of reject and map 
    for fibo_number in @fibonacci_array do
      yield fibo_number #yield each values in array of fibbonacci 
    end
  end

end

f = Fibonacci.new(6)
puts ""
f.each {|x| puts x } # => [1,1,2,3,5,8]
puts ""
puts f.reject { |x| x.odd? }  # => [2,8]
puts ""
puts f.reject(&:odd?)  # => [2,8]
puts ""
puts f.map {|x| x*2} # => [1,1,2,3,5,8] 


