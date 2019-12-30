class FragmentNotesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        fragment_notes = FragmentNote.all
        render json: fragment_notes
    end

    def show
        fragment_note = FragmentNote.find(params[:id])
        render json: fragment_note
    end

    def create
        fragment_note = FragmentNote.create(fragment_note_params)
        if client_has_valid_token?
            render json: fragment_note
        else
            render json: { errors: fragment_note.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def update
        fragment_note = FragmentNote.find(params[:id])
        if fragment_note.update(fragment_note_params)
            render json: fragment_note.to_json
        else
            render json: fragment_note.errors, status: :unprocessable_entity
        end 
    end

    def destroy
        FragmentNote.destroy(params[:id])
    end
    private

    def fragment_note_params
        params.require(:fragment_note).permit( :id, :fragment_id, :text)
    end
end
