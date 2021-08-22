require 'time'
class Time
    def humanize
        hour_humanize = {12=>"twelve", 11 => "eleven", 10 => "ten", 9 => "nine", 8 => "eight", 
	7 => "seven", 6 => "six", 5 => "five", 4 => "four", 3 => "three", 2 => "two", 1 => "one", 0 => "zero" } 
	#hash to collect hour to humanize 

        hour = self.hour > 12 ? self.hour-12 : self.hour  #calculate hours
	
	quarter_humanize_array = { 0 => "", 3 => "a quartur til", 2 => "half past", 1 => ""} #hast to collect quater call 
       
	
	quarter = (self.min/15).to_i #calculate which quarter hit 
	

	
	if self.hour == 23  #if near midnight 
	   "About midnight"
	elsif self.hour == 0 #if just pass midnight
	   around_time = self.min/15.0.to_f 
	   around_time = around_time.round()*15
	   "About #{hour+12}:#{around_time}"
	elsif quarter == 3  #if quarter 3 means most hit next hour 
	   "About #{quarter_humanize_array[quarter]} #{hour_humanize[hour+1]}" # quarter + hours+1 call 
	else 
	   "About #{quarter_humanize_array[quarter]} #{hour_humanize[hour]}" # quarter + hours call  if not close to next hours 
	end


 
    end
end

sample = ["10:47 pm", "10:31 pm", "10:07 pm", "23:58", "00:29"]
sample.each {|t| 
    puts t
    puts Time.parse(t).humanize
}

#10:47 pm
#About a quartur til eleven

#10:31 pm
#About half past ten

#10:07 pm
#About  ten

#23:58
#About midnight

#00:29
#About 12:30

