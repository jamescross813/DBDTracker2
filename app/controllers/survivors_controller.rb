class SurvivorsController < ApplicationController

    get '/survivors' do
        
        @survivors = Survivor.all
        erb :'/survivors/index'
    end
    
    get '/survivors/new' do 
        @survivors = Survivor.all
        @perks = []
        Perk.all.each do |perk|
            if perk.role == "Survivor"
            @perks << perk  
            end
        end
        erb :'/survivors/new'
    end
    
    post'/survivors/new' do
        @survivor = UserSurvivors.create(survivor_id: params[:survivor][:id])
        
        @survivor.perks << SurvivorPerks.create(survivor_id: params[:survivor][:id], perk_id: params[:survivor][:perk_ids])
        
        redirect "/survivors/#{@survivor.id}"
    end
    
    get '/survivors/:id' do 
        # binding.pry
        @survivor = Survivor.find(params[:id])
        erb :'/survivors/show'
    end
    
    patch '/survivors/:id/edit' do
    end
    
    delete '/survivors/:id/delete' do
    end
    end