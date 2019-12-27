class CharacterNotesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        character_notes = CharacterNote.all
        render json: character_notes
    end

    def show
        character_note = CharacterNote.find(params[:id])
        render json: character_note
    end

    def create
        character_note = CharacterNote.create(character_note_params)
        if character_note.valid?
        render json: { token: token(character_note.id), character_note_id: character_note.id }
        
        else
        render json: { errors: character_note.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def update
        character_note = CharacterNote.find(params[:id])
        if character_note.update(character_note_params)
            render json: character_note.to_json
        else
        render json: character_note.errors, status: :unprocessable_entity
        end 
        end

        def destroy
            CharacterNote.destroy(params[:id])
        end
    private

    def character_note_params
        params.require(:character_note).permit(:character_id, :text)
    end
end
