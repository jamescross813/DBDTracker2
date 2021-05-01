class UsersController < ApplicationController
    get '/users/:id' do
        @user = User.find_by_id(session[:user_id])
        @currencies = @user.currencies
    
        @killer_ids = []
        @killer_ids << UserKiller.find_by(:user_id => session[:user_id])
     
        
        erb :'/users/show'
    end
    
    get '/users/:id/edit' do
        @user = User.find_by_id(session[:user_id])
        erb :'/users/edit'
    end
    
    
    patch '/users/:id' do
        @user = User.find_by_id(session[:user_id])
        @user.username = params[:username]
        @user.save
        redirect to "/users/#{@user.id}"
    end
    
    delete '/users/:id/delete' do
        @user = User.find_by_id(session[:user_id])
        @user.delete
        redirect to "/"
    end
    
end