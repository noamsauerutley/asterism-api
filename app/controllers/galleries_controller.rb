class GalleriesController < ApplicationController
            
    def index
        galleries = Gallery.all
        render json: galleries
    end

    def show
        gallery = Gallery.find(params[:id])
        render json: gallery
    end

    def create
        gallery = Gallery.create(gallery_params)
        if gallery.valid?
        render json: { token: token(gallery.id), gallery_id: gallery.id }
        
        else
        render json: { errors: gallery.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def update
        gallery = Gallery.find(params[:id])
        if gallery.update(gallery_params)
            render json: gallery.to_json
        else
        render json: gallery.errors, status: :unprocessable_entity
        end 
        end
    private

    def gallery_params
        params.require(:gallery).permit(:image)
    end
end
