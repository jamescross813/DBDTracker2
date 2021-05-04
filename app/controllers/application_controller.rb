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

    post '/registrations/signup' do 
        @user = User.new(:username => params[:username], :password => params[:password])
        if @user.save
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
          else
            redirect '/failure'
          end
    end

    get '/failure' do
        erb :failure
    end

    get '/login' do
        erb :'/sessions/login'
    end

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect "/users/#{@user.id}"
        else
            redirect '/failure'
        end
    end

    get '/logout' do
        session.clear
        redirect to "/"
    end


end