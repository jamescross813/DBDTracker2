trapper_http = HTTParty.get("https://deadbydaylight.fandom.com/wiki/Evan_MacMillan")

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