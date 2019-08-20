class ImagesController < ApplicationController
  before_action :set_image, only: %i[show destroy]
  def index
    @images = if params[:tag].blank?
                Image.all
              else
                Image.tagged_with(params[:tag])
              end
  end

  def show; end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image
    else
      render 'new'
    end
  end

  def destroy
    @image.destroy

    redirect_to images_path
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:title, :text, :tag_list)
  end
end
