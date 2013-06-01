class RunningProjectController < ApplicationController
  def create
    json = JSON.parse(params[:running_project])
    RunningProject.new(json).save!

    respond_to do |format|
      format.html { render layout: false }
      format.json { render json: nil }
    end
  end
end
