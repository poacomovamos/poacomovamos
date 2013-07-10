require 'spec_helper'

describe SessionsController do
  it 'returns the list of assembly days with its assiduity' do
    create(:session, number: 1)
    create(:session, number: 2)
    
    sessions = [
      {
        "date" => "2013-05-27T00:00:00Z",
        "number" => 1,
        "session_type" => "O"
      },
      {
        "date" => "2013-05-27T00:00:00Z",
        "number" => 2,
        "session_type" => "O"
      }
    ]
    
    get :index

    JSON.parse(response.body).should == sessions
  end
end
