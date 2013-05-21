module SessionsHelper
  def class_for_day month, day
    return "out_of_month" if day.date.month != month.month.number
  end

  def weekdays_initials
    [ "D", "S", "T", "Q", "Q", "S", "S" ]
  end

  def assemblyman_presence day
    AssemblymanSessions.get_presence_for day.date
  end

end
