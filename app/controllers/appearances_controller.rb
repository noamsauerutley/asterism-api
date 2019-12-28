class AppearancesController < ApplicationController
    skip_before_action :verify_authenticity_token

           
    def index
        appearances = Appearance.all
        render json: appearances
    end

    def show
        appearance = Appearance.find(params[:id])
        render json: appearance
    end

    def create
        if client_has_valid_token?
            appearance = Appearance.create(appearance_params)
            render json: appearance
        else
            render json: { errors: appearance.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def update
        appearance = Appearance.find(params[:id])
        if appearance.update(appearance_params)
            render json: appearance.to_json
        else
        render json: appearance.errors, status: :unprocessable_entity
        end 
        end

        def destroy
            Appearance.destroy(params[:id])
        end
    private

    def appearance_params
        params.require(:appearance).permit(:scene_id, :character_id, :appearance_notes)
    end
end
