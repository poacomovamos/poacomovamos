class SessionsCalendar
  class << self
    def for_year year
      (1..12).to_a.collect { |month| Cal::MonthlyCalendar.new year, month, :start_week_on => :sunday }
    end
  end
end
  
