require 'spec_helper'

describe Project do
  it "has a valid factory" do
    create(:project).should be_valid
  end

  it "is invalid without a number" do
    build(:project, number: nil).should_not be_valid
  end

  it "is invalid without a year" do
    build(:project, year: nil).should_not be_valid
  end

  it "is invalid without a type" do
    build(:project, type: nil).should_not be_valid
  end

  it "is invalid without a materia" do
    build(:project, materia: nil).should_not be_valid
  end

  it "is invalid without an ementa" do
    build(:project, ementa: nil).should_not be_valid
  end

  it "is invalid without a processing_date" do
    build(:project, processing_date: nil).should_not be_valid
  end

  it "is invalid without a sector" do
    build(:project, sector: nil).should_not be_valid
  end

  it "is invalid without authors" do
    build(:project, authors:nil).should_not be_valid
  end

  it "is valid even without a veto" do
    build(:project, veto:nil).should be_valid
  end

  it "does not allow duplicate project number" do
    create(:project, number: 42)
    build(:project, number: 42).should_not be_valid
  end
end
