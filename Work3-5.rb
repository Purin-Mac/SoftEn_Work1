#Time.now.at_beginning_of_year + 1.day
# => 2011-01-02 00:00:00 -0800

class Time
    def at_beginning_of_year
        Time.new(self.year, 1, 1, 0, 0, 0)
    end
end

class Integer
    def day
        self * 60 * 60 * 24
    end
end

puts Time.now.at_beginning_of_year + 1.day