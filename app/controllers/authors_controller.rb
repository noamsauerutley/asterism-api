class AuthorsController < ApplicationController
    skip_before_action :verify_authenticity_token
   
    def index
        authors = Author.all
        render json: authors
    end

    def create
        author = Author.create(author_params)
        if author.valid?
        render json: { token: token(author.id), author_id: author.id }
        
        else
        render json: { errors: author.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def update
        author = Author.find(params[:id])
        if author.update(author_params)
            render json: author.to_json
        else
        render json: author.errors, status: :unprocessable_entity
        end 
        end
    private

    def author_params
        params.require(:author).permit(:username, :password_digest, :email, :image_url, :bio)
    end
end
