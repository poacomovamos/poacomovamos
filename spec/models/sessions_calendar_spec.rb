require 'spec_helper'

describe SessionsCalendar do
  describe "#for_year" do
    it "returns an array with a monthly calendar for each month of that year" do
      calendario_sessao = SessionsCalendar.for_year 2013
      calendario_sessao.size.should == 12
      calendario_sessao.first.month.number.should == 1
      calendario_sessao.last.month.number.should == 12
    end
  end
end
