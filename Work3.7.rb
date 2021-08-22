module Enumerable
    def each_with_custom_index(start,step) 
        index = start
        self.each{|value|
            yield  value , index  #yield values and indexing
            index += step #increasing 
        }
    end

 
end

%w(alice bob carol).each_with_custom_index(3,3) do |person,index|
    puts ">> #{person} is number #{index}"
end

%w(alice bob carol).each_with_index do |person,index|
    puts ">> #{person} is number #{index}"
end
