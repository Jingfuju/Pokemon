class PokemonController < ApplicationController
    def capture
        @pokemon = Pokemon.find(params[:id])
        @pokemon.trainer = current_trainer
        
        if @pokemon.save
            redirect_to root_path
        end
    end
    
    def damage
        @pokemon = Pokemon.find(params[:id])
        @pokemon.health -=10
        
          if @pokemon.health <= 0
             @pokemon.destroy
          else
             @pokemon.save
          end
          redirect_to trainer_path(current_trainer)
    end
    
    def create
        @pokemon = Pokemon.new(poke_params)
        @pokemon.level = 1
        @pokemon.health = 100
        @pokemon.trainer = current_trainer
        if @pokemon.save
            redirect_to trainer_path(current_trainer)
        else 
            redirect_to :back
            flash[:error] = @pokemon.errors.full_messages.to_sentence
        end
        
    end

    def new
    end
  
    private
    def poke_params
        params.require(:pokemon).permit(:name)
    end 
end


