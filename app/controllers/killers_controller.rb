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
        
        post'/killers' do
            binding.pry
            @user = User.find(session[:user_id])

            UserKiller.create(killer_id: params[:killer][:killer_id], :user_id => @user)
            KillerPerk.create(killer_id: params[:killer][:killer_id], perk_id: params[:killer][:perk_ids])
            
            redirect "/killers/#{@killer.id}"
        end
        
        get '/killers/:id' do 
           
            @killer = Killer.find(params[:id])
            erb :'/killers/show'
        end
        
        patch '/killers/:id/edit' do
        end
        
        delete '/killers/:id/delete' do
        end
end