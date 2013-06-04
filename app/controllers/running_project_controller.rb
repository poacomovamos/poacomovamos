class RunningProjectController < ApplicationController
  def create
    json = JSON.parse(params[:running_project])
    @running_project = RunningProject.new(json)

    respond_to do |format|
      if @running_project.save
        format.json { render json: @running_project, status: :created }
        format.xml { render json: @running_project, status: :created }
      else
        format.json { render json: @running_project.errors, status: :unprocessable_entity }
        format.xml { render json: @running_project.errors, status: :unprocessable_entity }
      end
    end
  end
end
