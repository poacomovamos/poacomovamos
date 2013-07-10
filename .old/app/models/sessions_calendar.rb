# encoding: utf-8

class SessionsCalendar
  class << self
    PORTUGUESE_MONTHS =
      [ "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro" ]

    def for_year(year)
      (1..12).to_a.zip(PORTUGUESE_MONTHS).collect do |month, month_name|
        SessionCalendar.new(month_name, Cal::MonthlyCalendar.new(year, month, start_week_on: :sunday))
      end
    end
  end
end

