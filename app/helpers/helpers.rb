class Helpers


    def self.current_user(session)
        @user = User.find_by_id(session[:user_id])
        @user
    end

    def self.logged_in?(session)
        !!session[:user_id]
    end

    def self.is_killer_mine?(session, killer)
        
        @user = User.find_by_id(session[:user_id])
        @killer = Killer.find(killer)
        @killerperks = []
        UserKillerPerk.all.each do |ukp|
            
            if ukp.user_id == @user.id && ukp.killer_id == @killer.id
          
                @killerperks << ukp
            end
            @killerperks
        end
        
        @killerperks.any?
        
    end

    def self.is_survivor_mine?(session, survivor)
        
        @user = User.find_by_id(session[:user_id])
        @survivor = Survivor.find(survivor)
        @survivorperks = []
        UserSurvivorPerk.all.each do |usp|
            
            if usp.user_id == @user.id && usp.survivor_id == @survivor.id
          
                @survivorperks << usp
            end
            @survivorperks
        end
        
        @survivorperks.any?
        
    end

    
end