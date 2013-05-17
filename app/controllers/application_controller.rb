class ApplicationController < ActionController::Base
  protect_from_forgery
  
  MOCK_SESSOES = [
    {
      :year => 2013,
      :months => [
        { 
          :month => 1,
          :frequency => [
            {
              :day => 2,
              :present => 10
            },
            {
              :day => 9,
              :present => 5
            } 
          ]
        },
        {
          :month => 7,
          :frequency => [
            {
              :day => 8,
              :present => 15
            }
          ]
        }  
      ]
    }
  ]

  def sessoes
    respond_to do |format|
      format.html
      format.json { render :json => MOCK_SESSOES }
    end
  end
end
