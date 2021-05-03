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
        @killer = Killer.find(params[:killer][:killer_id])   
        
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
        @killer = Killer.find_by(id: params[:id])
        
        if @killer
            if session.has_key?(:user_id)
                @user = User.find(session[:user_id])  
                
                @killerperks = []

                UserKillerPerk.all.each do |ukp|
                    if ukp.user_id == @user.id && ukp.killer_id == @killer.id  
                        @killerperks << ukp
                    end
                end
                @killerperks   
            else
                @killer = Killer.find(params[:id])
            end   
        
            erb :'/killers/show'
        else
            redirect '/failure'
        end
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
        @killer = Killer.find(params[:id])
       
        @killerperks = []
        UserKillerPerk.all.each do |ukp|
            if ukp.user_id == @user.id && ukp.killer_id == @killer.id
                @killerperks << ukp.perk_id
            end
        end
        @killerperks
         erb :'/killers/edit'
     end
        
    patch '/killers/:id/edit' do 
        if session.has_key?(:user_id)
            @user = User.find(session[:user_id])  
        end    
      
        @killer = Killer.find(params[:id])  
     
        UserKillerPerk.all.each do |ukp|
            
            if ukp.user_id == @user.id && ukp.killer_id == @killer.id
                ukp.delete
            end  
        end 

        @killerperks = []
        
        params[:killer][:perk_ids].each do |p|     
             UserKillerPerk.create(:killer_id => @killer.id, user_id: @user.id, perk_id: p)   
        end   

        redirect "/killers/#{@killer.id}"
    end
        
    delete '/killers/:id/delete' do
        if session.has_key?(:user_id)
            @user = User.find(session[:user_id])  
        end      
        @killerusers = @user.killers
        @killer = Killer.find(params[:id])
       
        UserKillerPerk.all.each do |ukp|
            if ukp.user_id == @user.id && ukp.killer_id == @killer.id
                ukp.delete
            end  
        end

            @killerusers.each do |ku|
                if ku.id == @killer.id
                    ku.delete
                end
            end
                redirect to "/users/#{@user.id}"
    end

end