require 'spec_helper'

describe SessionScraperHelper do
  link = "/votacoes?data=20/05/2013+00:00:00&numero=43&tiposessao=O"

  describe "#parse_link" do
    it "parses the date" do
      SessionScraperHelper.parse(link)[:date].should == Date.new(2013, 5, 20)
    end

    it "parses the session number" do
      SessionScraperHelper.parse(link)[:number].should == 43
    end

    it "parses the session type" do
      SessionScraperHelper.parse(link)[:session_type].should == "O"
    end
  end
end
