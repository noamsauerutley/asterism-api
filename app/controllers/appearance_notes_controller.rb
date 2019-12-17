class AppearanceNotesController < ApplicationController
    def index
        appearance_notes = AppearanceNote.all
        render json: appearance_notes
    end

    def show
        appearance_note = AppearanceNote.find(params[:id])
        render json: appearance_note
    end

    def create
        appearance_note = AppearanceNote.create(appearance_note_params)
        if appearance_note.valid?
        render json: { token: token(appearance_note.id), appearance_note_id: appearance_note.id }
        
        else
        render json: { errors: appearance_note.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def update
        appearance_note = AppearanceNote.find(params[:id])
        if appearance_note.update(appearance_note_params)
            render json: appearance_note.to_json
        else
        render json: appearance_note.errors, status: :unprocessable_entity
        end 
        end
    private

    def appearance_note_params
        params.require(:appearance_note).permit(:appeance_id, :text)
    end
end
