class CharactersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        characters = Character.all
        render json: characters
    end

    def show
        character = Character.find(params[:id])
        render json: character
    end

    def create
        character = Character.create(character_params)
        if client_has_valid_token?
        render json: character
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

        def destroy
            Character.destroy(params[:id])
        end
    private

    def character_params
        params.require(:character).permit( :story_id, :name, :description, :character_notes, :gallery, :appearances)
    end
end
