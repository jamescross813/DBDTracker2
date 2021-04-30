class Perk < ActiveRecord::Base
    has_many :survivor_perks
    has_many :survivors, through: :survivor_perks
    has_many :killer_perks
    has_many :killers, through: :killer_perks
    
end