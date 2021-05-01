class PerksController < ApplicationController

    get '/perks' do
        @perks_survivor = []
        @perks_killer = []
        Perk.all.each do |perk|
            
        if perk.role == "Survivor"
            @perks_survivor << perk        
        else
            @perks_killer << perk   
        end
    end
        erb :'/perks/index'
    end
    
    post'/perks/new' do
    
    end
    
    get '/perks/:id' do 
        @perk = Perk.find(params[:id])
        erb :'/perks/show'
    end
    
    patch '/perks/:id/edit' do
    end
    
    delete '/perks/:id/delete' do
    end
    
    end