class StoriesController < ApplicationController
    def index
        stories = Story.all
        render json: stories
    end

    def create
        story = Story.create(story_params)
        if story.valid?
        render json: { token: token(story.id), story_id: story.id }
        
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
    private

    def story_params
        params.require(:story).permit(:author_id, :title, :summary)
    end
end
