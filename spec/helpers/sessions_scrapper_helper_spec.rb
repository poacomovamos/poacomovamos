require 'spec_helper'

describe SessionScrapperHelper do
	link = "/votacoes?data=20/05/2013+00:00:00&numero=43&tiposessao=O"


	describe "#parse_link" do
		it "parses the date" do
			SessionScrapperHelper.parse(link)[:date].should == Date.new(2013, 5, 20)
		end

		it "parses the session number" do
			SessionScrapperHelper.parse(link)[:number].should == 43
		end

		it "parses the session type" do
			SessionScrapperHelper.parse(link)[:type].should == "O"
		end
	end
end