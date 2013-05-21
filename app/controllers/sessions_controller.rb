class SessionsController < ApplicationController
  def sessions
    @sessions_calendar = SessionsCalendar.for_year params[:year]
  end
end
