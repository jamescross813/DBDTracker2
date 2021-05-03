class SurvivorsController < ApplicationController
    get '/survivors' do
            @survivors = Survivor.all
            erb :'/survivors/index'
        end
        
    get '/survivors/new' do 
        @user = User.find(session[:user_id])
        @survivors = Survivor.all
        @perks = []

        Perk.all.each do |p|
            if p.role == "Survivor"
                @perks << p
            end
        end

        erb :'/survivors/new'
    end
        
    post '/survivors' do
       @user = User.find(session[:user_id])
       @survivor = Survivor.find(params[:survivor][:survivor_id])

       @user.survivors << @survivor
       @survivorperks = []

       params[:survivor][:perk_ids].each do |p|
       
        @sp = UserSurvivorPerk.create(survivor_id: params[:survivor][:survivor_id], user_id: @user.id, perk_id: p)
        @survivorperks << @sp
       end

       @survivorperks

       redirect "/survivors/#{@survivor.id}"
    end
        
    get '/survivors/:id' do 
       @survivor = Survivor.find_by(id: params[:id])
       if @survivor
            if session.has_key?(:user_id)
                @user = User.find(session[:user_id])

                @survivorperks = []

                UserSurvivorPerk.all.each do |skp|
                    if skp.user_id == @user.id && skp.survivor_id == @survivor.id
                        @survivorperks << skp
                    end
                end
                @survivorperks
            else
                @survivor = Survivor.find(params[:id])
            end   
        
            erb :'/survivors/show'
        else 
            redirect '/failure'
        end
    end

    get '/survivors/:id/edit' do
        if session.has_key?(:user_id)
            @user = User.find(session[:user_id])
        end
        @survivor = Survivor.find(params[:id])
        @perks = []

        Perk.all.each do |p|
            if p.role == "Survivor"
                @perks << p
            end
        end
        @survivorperks = []
        UserSurvivorPerk.all.each do |skp|
            if skp.user_id == @user.id && skp.survivor_id == @survivor.id
                @survivorperks << skp.perk_id
            end
        end
        @survivorperks

        

        erb :'/survivors/edit'
    end
        
    patch '/survivors/:id' do
        if session.has_key?(:user_id)
            @user = User.find(session[:user_id])
        end

        @survivor = Survivor.find(params[:id])

        UserSurvivorPerk.all.each do|skp|

            if skp.user_id == @user.id && skp.survivor_id == @survivor.id
                skp.delete
            end
        end

        @survivorperks = []
       
        params[:survivor][:perk_ids].each do |p|
            UserSurvivorPerk.create(:survivor_id => @survivor.id, :user_id => @user.id, :perk_id => p)
        end

        redirect "/survivors/#{@survivor.id}"
    end
            
    delete '/survivors/:id/delete' do
       if session.has_key?(:user_id)
        @user = User.find(session[:user_id])
       end
       @survivorusers = @user.survivors
       @survivor = Survivor.find(params[:id])

       UserSurvivorPerk.all.each do |skp|
        if skp.user_id == @user.id && skp.survivor_id == @survivor.id
            skp.delete
        end
    end
        @survivorusers.each do |su|
            if su.id == @survivor.id
                su.delete
            end
        end
            redirect to "/users/#{@user.id}"
    end

end

