trapper = Killer.create(:name => data["name"], 
                        :realm => data["realm"], 
                        :power => data["power"], 
                        :weapon => data["weapon"], 
                        :speed => data["speed"],
                        :terror_radius => data["terror_radius"],
                        :height => data["height"],
                        :difficulty => data["difficulty"],
                        :overview => data["overview"],
                        :lore => data["lore"],
                        :dlc => data["dlc"])    
                end
        
        survivor = HTTParty.get("https://dbd-api.herokuapp.com/survivors")
        survivor_data = JSON.parse(survivor.body)
        
        survivor_data.each do |data|
                Survivor.create(:name => data["name"], 
                        :role => data["role"], 
                        :overview => data["overview"], 
                        :lore => data ["lore"], 
                        :difficulty => data["difficulty"],
                        :dlc => data["dlc"])  
                end  

        perk = HTTParty.get("https://dbd-api.herokuapp.com/perks")
        perk_data = JSON.parse(perk.body)

                perk_data.each do |data|
                        Perk.create(:perk_name => data["perk_name"], 
                                :description => data["description"], 
                                :teach_level => data["teach_level"], 
                                :role => data ["role"], 
                                :name => data["name"])  
                                
                        end 
        
      


