class AssiduitiesController < ApplicationController
  def index
    assiduities = Assiduity.all
    render :json => assiduities.to_json
  end
end
