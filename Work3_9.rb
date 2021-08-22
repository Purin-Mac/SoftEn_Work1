module Enumerable
	def each_with_flattening 
	  self.each do |item| 	#for each of  item contain 
	    if item.class == Array #if it's still array not fully flatten 
	      item.each_with_flattening { |s| yield s } #recursion 
	    else
	      yield item #yield 
	    end
	  end
	end
end

[1, [2, 3], 4, [[5, 6], 7]].each_with_flattening { |s| print "#{s}," }
puts "" 
