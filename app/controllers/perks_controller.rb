class PerksController < ApplicationController
  
    
    get '/perks/:id' do 
        @perk = Perk.find(params[:id])
        erb :'/perks/show'
    end
    
   
    
    end