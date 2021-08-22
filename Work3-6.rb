
class Class
    def attr_accessor_with_history(attr_name)
        self.class_eval("def #{attr_name};@#{attr_name};end") #if calling 
        self.class_eval %Q{
            def #{attr_name}=(value)
		@attr_history = Hash.new if @attr_history.nil?		
                if @attr_history["#{attr_name}"].nil?
			temp = Array.new() 
			temp << value
			@attr_history["#{attr_name}"] = temp
			

		else 	
			@attr_history["#{attr_name}"] << value
		end 
		@#{attr_name} = value
		
            end

            def history(attr)
                @attr_history[attr.to_s]  
            end
        }
    end
end

class Foo
    attr_accessor_with_history :bar
    attr_accessor_with_history :gay
end


f = Foo.new     # => #<Foo:0x127e678>
f.bar = 3       # => 3
f.bar = :wowzo  # => :wowzo
puts f.bar
f.bar = 'boo!'  # => 'boo!'
f.gay = 6 
puts "first"
puts f.history(:bar).class # => [3, :wowzo, 'boo!']
puts "second"
puts f.history (:gay) 
