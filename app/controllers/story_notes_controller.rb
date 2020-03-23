class StoryNotesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        story_notes = StoryNote.all
        render json: story_notes
    end

    def show
        story_note = StoryNote.find(params[:id])
        render json: story_note
    end

    def create
        story_note = StoryNote.create(story_note_params)
        if client_has_valid_token?
        render json: story_note
        else
        render json: { errors: story_note.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def update
        story_note = StoryNote.find(params[:id])
        if story_note.update(story_note_params)
            render json: story_note.to_json
        else
            render json: story_note.errors, status: :unprocessable_entity
        end 
    end

    def destroy
        StoryNote.destroy(params[:id])
    end
    private

    def story_note_params
        params.require(:story_note).permit( :id, :story_id, :text)
    end
end
