class SessionsController < ApplicationController
  def sessions
    @sessions_calendar = SessionsCalendar.for_year 2013
  end
end
