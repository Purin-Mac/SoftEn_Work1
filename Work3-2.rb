def method(arg, count = 0)
    if count == 0 # First time we use "".class"
        puts arg.class
        method(arg.class, 1)
    elsif count > 0 and count < 4 # Secound time we use ".supperclass"
        count += 1
        puts arg.superclass
        method(arg.superclass, count) # recursive function
    end
end

method(5)