class AppearanceNotesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        appearance_notes = AppearanceNote.all
        render json: appearance_notes
    end

    def show
        appearance_note = AppearanceNote.find(params[:id])
        render json: appearance_note
    end

    def create
        if client_has_valid_token?
            appearance_note = AppearanceNote.create(appearance_note_params)
            render json: appearance_note
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

        def destroy
            AppearanceNote.destroy(params[:id])
        end
    private

    def appearance_note_params
        params.require(:appearance_note).permit(:appeance_id, :text)
    end
end
