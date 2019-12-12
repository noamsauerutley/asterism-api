class CharactersController < ApplicationController

        
    def index
        characters = Character.all
        render json: characters
    end

    def create
        character = Character.create(character_params)
        if character.valid?
        render json: { token: token(character.id), character_id: character.id }
        
        else
        render json: { errors: character.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def update
        character = Character.find(params[:id])
        if character.update(character_params)
            render json: character.to_json
        else
        render json: character.errors, status: :unprocessable_entity
        end 
        end
    private

    def character_params
        params.require(:character).permit( :story_id, :name, :description)
    end
end
