require 'spec_helper'

describe AssiduitiesController do
  it 'returns the list of assembly days with its assiduity' do
    assiduities = [
      { "2013-01-01" =>  20 },
      { "2013-01-02" =>  10 }
    ]

    get :index

    JSON.parse(response.body).should == assiduities
  end
end
