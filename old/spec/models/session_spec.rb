require 'spec_helper'

describe Session do

    it "has a valid factory" do
      create(:session).should be_valid
    end
    
    it "is invalid without a number" do
      build(:session, number: nil).should_not be_valid
    end
    
    it "is invalid without a session type" do
      build(:session, session_type: nil).should_not be_valid
    end
    
    it "is invalid without a date" do
      build(:session, date: nil).should_not be_valid
    end
    
end
