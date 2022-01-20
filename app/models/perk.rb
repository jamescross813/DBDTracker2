class Perk < ActiveRecord::Base
    has_many :survivor_perks
    has_many :survivors, through: :survivor_perks
    has_many :killer_perks
    has_many :killers, through: :killer_perks
    

    def self.killer_base_perks

        self.where(role: "Killer").order(:perk_name)
        # @perks = []
        # Perk.all.select do |perk|
        #     if perk.role == "Killer"
        #         @perks << perk  
        #     end
        # end
        # @perks.sort_by(&:perk_name)
    end

    def self.survivor_base_perks
        self.where(role: "Survivor").order(:perk_name)
    end
end