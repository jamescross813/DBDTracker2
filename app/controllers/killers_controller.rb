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
            UserKiller.create(killer_id: params[:killer][:killer_id], :user_id => @user.id)

            params[:killer][:perk_ids].each do |p|
                
                KillerPerk.create(killer_id: params[:killer][:killer_id], perk_id: p) 
            end           
            redirect "/killers/#{@killer.id}"
        end
        
        get '/killers/:id' do 
            if session.has_key?(:user_id)
                @user = User.find(session[:user_id])
            end
            @killer = Killer.find(params[:id])
            erb :'/killers/show'
        end
        
        patch '/killers/:id/edit' do
            @user = User.find(session[:user_id])
            @killer = Killer.find_by_id(params[:killer][:killer_id])  
            @perkkiller = PerkKiller.find(:killer_id => @killer, :perk_id => params[:killer][:perk_ids])

            params[:killer][:perk_ids].each do |p|
                if PerkKiller.killer_id == @killer.id && KillerPerk.perk_id == p.id 
                    @perkkiller.delete
                    binding.pry
                    KillerPerk.create(killer_id: params[:killer][:killer_id], perk_id: p) 
                else
                    KillerPerk.create(killer_id: params[:killer][:killer_id], perk_id: p) 
                end           
            end
            redirect "/killers/#{@killer.id}"
        end
        
        delete '/killers/:id/delete' do
        end
end