
class Class
    def attr_accessor_with_history(*attr_names)
	attr_names.each do |attr_name|
		self.class_eval("def #{attr_name};@#{attr_name};end") #if calling attribute ruturn value of current state
		self.class_eval %Q{
		    def #{attr_name}=(value)   #setter attribute 
			@attr_history = Hash.new if @attr_history.nil? #if attribute not created before create 		
		        if @attr_history["#{attr_name}"].nil?	 #if that attribute not in hash hash["attribute"] or nil
				temp = Array.new() 	#create temp array
				temp << value		#insert value to temp array
				@attr_history["#{attr_name}"] = temp  #add temp array to hash history
				

			else 	
				@attr_history["#{attr_name}"] << value  #if array already created insert new values to hash history
			end 
			@#{attr_name} = value	 #set current values to attribute 
			
		    end

		    
		}
	end
	self.class_eval %Q{
		def history(attr)
		        @attr_history[attr.to_s]   #if call history return attribute wanted history -> h
		end}
    end
end

class Foo
    attr_accessor_with_history :bar, :loo
end


f = Foo.new     # => #<Foo:0x127e678>
f.bar = 3       # => 3
f.bar = :wowzo  # => :wowzo
f.bar = 'boo!'  # => 'boo!'
f.loo = 6 

print f.history(:bar) # => [3, :wowzo, 'boo!']
puts ""
print f.history (:loo) 
puts ""
