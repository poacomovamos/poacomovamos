require 'spec_helper'

describe RunningProject do
  it "has a valid factory" do
    create(:running_project).should be_valid
  end

  it "is invalid without a number" do
    build(:running_project, number: nil).should_not be_valid
  end

  it "is invalid without a year" do
    build(:running_project, year: nil).should_not be_valid
  end

  it "is invalid without a type" do
    build(:running_project, type: nil).should_not be_valid
  end

  it "is invalid without a materia" do
    build(:running_project, materia: nil).should_not be_valid
  end

  it "is invalid without an ementa" do
    build(:running_project, ementa: nil).should_not be_valid
  end

  it "is invalid without a processing_date" do
    build(:running_project, processing_date: nil).should_not be_valid
  end

  it "is invalid without a sector" do
    build(:running_project, sector: nil).should_not be_valid
  end

  it "is invalid without authors" do
    build(:running_project, authors:nil).should_not be_valid
  end

  it "is valid even without a veto" do
    build(:running_project, veto:nil).should be_valid
  end

  it "does not allow duplicate project number" do
    create(:running_project, number: 42)
    build(:running_project, number: 42).should_not be_valid
  end
end
