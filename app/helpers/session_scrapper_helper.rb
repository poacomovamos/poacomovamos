
module SessionScrapperHelper
	class << self

		def parse link
			{
				date: parse_date(link),
				type: parse_type(link),
				number: parse_number(link)
			}
		end

		private

		def parse_date link
			Date.parse(/data=(.*)\+/.match(link)[0])
		end

		def parse_type link
			/tiposessao=(.*)$/.match(link)[1]
		end

		def parse_number link
			/numero=(.*?)&/.match(link)[1].to_i
		end
	end

end
