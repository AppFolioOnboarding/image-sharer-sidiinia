require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest

  # test "the truth" do
  #   assert true
  # end
  setup do
    @image = Image.create!(title: 'sydney', text: 'http://blog.bongiovi.tw/wp-content/uploads/2015/03/03.jpg')
  end

  def test_index
    get images_path

    assert_response :ok
    assert_select 'h1', 'Listing images'

  end

  def test_new
    get new_image_path

    assert_response :ok
    assert_select 'form'
  end

  def test_show
    get image_path(@image.id)

    assert_response :ok
    assert_select '#name', 'sydney'
  end
end
