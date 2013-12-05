require './poacomovamos'

configure do
  require './environment'
end


run Sinatra::Application
