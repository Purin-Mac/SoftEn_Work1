class Numeric 
  @@currencies = {'yen' => 0.012, 'euro'=> 1.3, 'dollar' => 1 }  #hash of currency values 
  def method_missing(method_id, *args, &block)  #missing method overide 
    currency = method_id.to_s.gsub( /s$/, '')  #substacne string with s character 
    if @@currencies.has_key?(currency)  #check if contain that currency 
      self*@@currencies[currency]  #return result by currrency ratio 
    else 
      super #super init 
    end
  end
  def in(args)
    self.*@@currencies[args.to_s] #return result by currency ratio 
  end 
end 

puts 5.dollar.in(:euro)  #6.5
puts (1.euro - 50.yen).in(:dollar) # 0.700


