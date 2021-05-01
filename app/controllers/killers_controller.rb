class KillersController < ApplicationController
    get '/killers' do
            @killers = Killer.all
            erb :'/killers/index'
        end
        
    get '/killers/new' do 
        @user = User.find(session[:user_id])
        @killers = Killer.all
        @perks = []

        Perk.all.each do |perk|
            if perk.role == "Killer"
                @perks << perk  
            end
        end
    
        erb :'/killers/new'
    end
        
    post '/killers' do
        @user = User.find(session[:user_id])
        @killer = Killer.find_by_id(params[:killer][:killer_id])   
        @user.killers << @killer      
        @killerperks =[] 
        
        params[:killer][:perk_ids].each do |p|     
            @kp = UserKillerPerk.create(killer_id: params[:killer][:killer_id], user_id: @user.id, perk_id: p)
            @killerperks << @kp   
        end 
        
        @killerperks  

        redirect "/killers/#{@killer.id}"
    end
        
    get '/killers/:id' do 
        if session.has_key?(:user_id)
            @user = User.find(session[:user_id])  
            @killer = Killer.find_by_id(params[:id])
            @killerperks = []

            UserKillerPerk.all.each do |ukp|
                if ukp.user_id == @user.id && ukp.killer_id == @killer.id
                    @killerperks << ukp
                end
            end
            @killerperks 
        else
            @killer = Killer.find_by_id(params[:id])
        end   
        erb :'/killers/show'
    end

    get '/killers/:id/edit' do
        
        if session.has_key?(:user_id)
            @user = User.find(session[:user_id])  
        end
        @perks = []
        Perk.all.each do |perk|
            if perk.role == "Killer"
                @perks << perk  
            end
        end 
        
        
        @killer = Killer.find_by_id(params[:id])
        # @killerperks = []
        # UserKillerPerk.all.each do |ukp|
        #     if ukp.user_id == @user.id && ukp.killer_id == @killer.id
        #         @killerperks << ukp
            
        #     end    
        # end 
         erb :'/killers/edit'
     end
        
    patch '/killers/:id' do
        
        if session.has_key?(:user_id)
            @user = User.find(session[:user_id])  
        

        @killer = Killer.find_by_id(params[:killer][:killer_id])  

        UserKillerPerk.all.each do |ukp|
            if ukp.user_id == @user.id && ukp.killer_id == @killer.id
                ukp.delete
            end  
        end 
        @killerperks = []

        UserKillerPerk.all.each do |ukp|
            if ukp.user_id == @user.id && ukp.killer_id == @killer.id
                @killerperks << ukp
            end  


        end
    end 
        
            redirect "/killers/#{@killer.id}"
    end
        
    delete '/killers/:id/delete' do
    end
end