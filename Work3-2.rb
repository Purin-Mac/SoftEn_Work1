def Foo(arg, count = 0)
    if count == 0
        puts arg.class
        Foo(arg.class, 1)
    elsif count > 0 and count < 4
        count += 1
        puts arg.superclass
        Foo(arg.superclass, count)
    elsif count == 4
        puts " "
    end

end
Foo(5)