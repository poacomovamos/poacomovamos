Poacomovamos::Application.routes.draw do
  resources :sessions, :only => :index

  match "/sessoes" => "sessions#sessions"
  post "/projetos" => "running_project#create"
end
