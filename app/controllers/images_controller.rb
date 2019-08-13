class ImagesController < ApplicationController
  def new
  end

  def create
    @image = Image.new(image_params)

    @image.save
    redirect_to @image
  end

  private
  def image_params
    params.require(:image).permit(:title, :text)
  end
end
