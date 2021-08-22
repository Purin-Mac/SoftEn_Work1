def my_swap(a,b)
    b,a = a,b
end
  
class Foo
    attr_accessor :a, :b
    def my_swap_2()
        @b,@a = @a,@b
    end
end
  
def my_string_replace_1(s)
    s.gsub( /Hi/, 'Hello')
end
  
def my_string_replace_2(s)
    s.gsub!( /Hi/, 'Hello')
end