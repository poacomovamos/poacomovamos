module SessionScraperHelper
  def self.parse(link)
    {
      date: parse_date(link),
      session_type: parse_session_type(link),
      number: parse_number(link)
    }
  end

  private

  def self.parse_date(link)
    Date.strptime(/data=\d+\/\d+\/\d+/.match(link)[0], 'data=%d/%m/%Y')
  end

  def self.parse_session_type(link)
    /tiposessao=(.*)$/.match(link)[1]
  end

  def self.parse_number(link)
    /numero=(.*?)&/.match(link)[1].to_i
  end
end
