module Enumerable 
  def each_permuted
    self.sort_by!{rand}  #map values with random and sort 
    self.each do  |item|    #for each shuffled item yield 
	yield item
    end 
  end
end

[1,2,3,56,7,43,2].each_permuted { |item| puts item }

