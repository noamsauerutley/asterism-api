class FragmentsController < ApplicationController

    def index
        fragments = Fragment.all
        render json: fragments
    end

    def show
        fragment = Fragment.find(params[:id])
        render json: fragment
    end

    def create
        fragment = Fragment.create(fragment_params)
        if fragment.valid?
        render json: { token: token(fragment.id), fragment_id: fragment.id }
        
        else
        render json: { errors: fragment.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def update
        fragment = Fragment.find(params[:id])
        if fragment.update(fragment_params)
            render json: fragment.to_json
        else
            render json: fragment.errors, status: :unprocessable_entity
        end 
    end
    private

    def fragment_params
        params.require(:fragment).permit(:author_id, :title, :text)
    end
end
