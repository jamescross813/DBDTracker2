class SurvivorsController < ApplicationController
    get '/survivors' do
            @survivors = Survivor.all
            erb :'/survivors/index'
        end
        
    get '/survivors/new' do 
        @user = User.find(session[:user_id])
        @survivors = Survivor.all
        @perks = []

        Perk.all.each do |perk|
            if perk.role == "Survivor"
                @perks << perk  
            end
        end
    
        erb :'/survivors/new'
    end
        
    post '/survivors' do
        @user = User.find(session[:user_id])
        @Survivor = Survivor.find(params[:Survivor][:Survivor_id])   
        
        @user.survivors << @survivor      
        @Survivorperks =[] 
        
        params[:Survivor][:perk_ids].each do |p|     
            @kp = UserSurvivorPerk.create(survivor_id: params[:survivor][:survivor_id], user_id: @user.id, perk_id: p)
            @survivorperks << @kp   
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

                UserSurvivorPerk.all.each do |ukp|
                    if ukp.user_id == @user.id && ukp.survivor_id == @survivor.id
                        
                        @survivorperks << ukp
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
        @perks = []
        Perk.all.each do |perk|
            if perk.role == "Survivor"
                @perks << perk  
            end
        end 
        @survivor = survivor.find(params[:id])
       
         erb :'/survivors/edit'
     end
        
    patch '/survivors/:id/edit' do
        
        if session.has_key?(:user_id)
            @user = User.find(session[:user_id])  
        
        end    
      
        @survivor = Survivor.find(params[:id])  
     
        UserSurvivorPerk.all.each do |ukp|
            
            if ukp.user_id == @user.id && ukp.survivor_id == @survivor.id
                ukp.delete
            end  
        end 

        @survivorperks = []
        
        params[:survivor][:perk_ids].each do |p|     
             UserSurvivorPerk.create(:Survivor_id => @survivor.id, user_id: @user.id, perk_id: p)   
        end   

        redirect "/survivors/#{@Survivor.id}"
    end
        
    delete '/survivors/:id/delete' do
        if session.has_key?(:user_id)
            @user = User.find(session[:user_id])  
        end      
        @survivorusers = @user.survivors
        @survivor = Survivor.find(params[:id])
        UserSurvivorPerk.all.each do |ukp|
            if ukp.user_id == @user.id && ukp.Survivor_id == @Survivor.id
                ukp.delete
            end  
        end

        @survivorusers.each do |ku|
            
            if ku.id == @survivor.id
                ku.delete
            end
        end
        
        redirect to "/users/#{@user.id}"
    end

end

