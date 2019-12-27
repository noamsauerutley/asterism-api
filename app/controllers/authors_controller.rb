class AuthorsController < ApplicationController
    skip_before_action :verify_authenticity_token
   
    def index
        authors = Author.all
        render json: authors
    end

    def show
        author_id = params[:id]
        if current_user_id == author_id.to_i
        author = Author.find(author_id)
        render json: author
        else render json: { go_away: true }, status: :unauthorized
        end
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
            render json: author
        else
            render json: author.errors, status: :unprocessable_entity
        end 
    end

    def destroy
        Author.destroy(params[:id])
    end
    
    private

    def author_params
        params.require(:author).permit(:username, :password, :email, :image_url, :bio)
    end
end
