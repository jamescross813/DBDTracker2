class Helpers


    def self.current_user(session)
        @user = User.find_by_id(session[:user_id])
        @user
    end

    def self.logged_in?(session)
        !!session[:user_id]
    end

    def self.is_mine?(session, killer)
        
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

    
end