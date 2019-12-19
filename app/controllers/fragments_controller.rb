class FragmentsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        fragments = Fragment.all
        render json: fragments
    end

    def show
        fragment = Fragment.find(params[:id])
        render json: fragment
    end

    def create
        if client_has_valid_token?
            fragment = Fragment.create(fragment_params)
            render json: fragment
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

    def destroy
        Fragment.destroy(params[:id])
    end
    
    private

    def fragment_params
        params.require(:fragment).permit(:author_id, :title, :text)
    end
end
