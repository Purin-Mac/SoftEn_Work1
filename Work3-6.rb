class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s
        attr_history = attr_name + '_history'
        self.class_eval("def #{attr_name};@#{attr_name};end")
        self.class_eval %Q{
            def #{attr_name}=(value)
                @#{attr_history} = [] if @#{attr_history}.nil?
                @#{attr_history} << value
                @#{attr_name} = value
            end

            def history(#{attr_name})
                @#{attr_history}
            end
        }
    end
end

class Foo
    attr_accessor_with_history :bar
end

f = Foo.new     # => #<Foo:0x127e678>
f.bar = 3       # => 3
puts f.bar
f.bar = :wowzo  # => :wowzo
puts f.bar
f.bar = 'boo!'  # => 'boo!'
puts f.bar
print f.history(:bar) # => [3, :wowzo, 'boo!']
print "\n"