Poacomovamos::Application.routes.draw do
  resources :assiduities, :only => :index

  match "/assiduidade" => "sessions#sessions"
  post "/projetos" => "running_project#create"
end
