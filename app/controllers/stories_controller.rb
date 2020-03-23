class StoriesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        stories = Story.all
        render json: stories
    end

    def show
        story = Story.find(params[:id])
        render json: story
    end

    def create
        if client_has_valid_token?
            story = Story.create(story_params)
            render json: story
        else
            render json: { errors: story.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def update
        story = Story.find(params[:id])
        if story.update(story_params)
            render json: story.to_json
        else
            render json: story.errors, status: :unprocessable_entity
        end 
    end

    def destroy
        Story.destroy(params[:id])
    end

    private

    def story_params
        params.require(:story).permit(:author_id, :title, :summary, :plots, :characters, :story_notes)
    end
end
