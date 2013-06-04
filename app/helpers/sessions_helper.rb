module SessionsHelper
  def class_for_day(month, day)
    day.date.month != month.month.number ? "out_of_month" : "presence_color_#{assemblyman_presence(day)}"
  end

  def weekdays_initials
    [ "D", "S", "T", "Q", "Q", "S", "S" ]
  end

  private

  def assemblyman_presence(day)
    AssemblymanSessions.get_presence_for(day.date)
  end
end
