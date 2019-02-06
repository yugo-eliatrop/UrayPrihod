class PicturesController < ApplicationController
  def create
    @picture = Picture.new(image_params)
    @picture.save
    render json: { url: @picture.image.url, picture_id: @picture.id }
  end

  def destroy
    picture = Picture.find(params[:id])
    picture.destroy
    render json: { status: :ok }
  end

  private

  def image_params
    params.require(:picture).permit(:image)
  end
end
