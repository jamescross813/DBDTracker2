class CurrenciesController < ApplicationController
    
    get '/currencies/new' do 
        erb :'/currencies/new'
    end
    
    post '/currencies' do
        @currency = Currency.new(params)
        @user = User.find(session[:user_id]) 
        @user.currencies << @currency
        @currency.save
        redirect "users/#{@user.id}"
    end
    
    get '/currencies/:id' do 
        @user = User.find_by_id(session[:user_id])
        @currency = Currency.find(params[:id])
        erb :'/currencies/show'
    end
    
    get '/currencies/:id/edit' do
        @user = User.find_by_id(session[:user_id])
        @currency = Currency.find(params[:id])
        erb :'/currencies/edit'
      end
    
    patch '/currencies/:id' do 
        @user = User.find_by_id(session[:user_id])
        @currency = Currency.find(params[:id])
        if @currency && @currency.user_id == session[:user_id]
            @currency.update(params["currency"])
        end
        redirect to "/currencies/#{@currency.id}"
    end
    
    delete '/currencies/:id/delete' do
        @user = User.find_by_id(session[:user_id])
        @currency = Currency.find_by_id(params[:id])
        @currency.delete
        redirect to "/users/#{@user.id}"
    end
end