require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

    configure do
            set :views, "app/views"
            enable :sessions
            set :session_secret, "password_security"
    end
  
    get '/' do
        erb :index
    end

    get '/registrations/signup' do
        erb :'/registrations/signup'
    end

end