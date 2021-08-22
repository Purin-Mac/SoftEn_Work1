def methodA(i, f)
    return i+=f 
end
def methodB(i, f)
    return i = i+f
end

i = 1
f = 1
puts methodA(i, f) == methodB(i, f) #ture
