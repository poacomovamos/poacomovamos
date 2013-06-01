require 'spec_helper'

describe RunningProjectController do
  context "with valid attributes" do
    it "creates a new running project" do
      @request.env["HTTP_ACCEPT"] = "application/json"
      @request.env["HTTP_CONTENT_TYPE"] = "application/json"

      json = build(:running_project).to_json(
        only: [:number, :year, :type, :materia, :ementa,
          :processing_date, :sector, :authors, :status, :veto]
      )

      expect {
        post :create, running_project: json
      }.to change {
        RunningProject.count
      }.by(1)
    end
  end

  context "with invalid attributes" do
    it "does not create a new running project" do
      @request.env["HTTP_ACCEPT"] = "application/json"
      @request.env["HTTP_CONTENT_TYPE"] = "application/json"

      json = build(:running_project, number: nil).to_json(
        only: [:number, :year, :type, :materia, :ementa,
          :processing_date, :sector, :authors, :status, :veto]
      )

      expect {
        post :create, running_project: json
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end
end
