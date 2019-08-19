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
    assert_equal 'sydney', @image.title
    assert_equal 'http://blog.bongiovi.tw/wp-content/uploads/2015/03/03.jpg', @image.text
  end

  def test_new
    get new_image_path

    assert_response :ok
    assert_select 'form'
  end

  def test_show
    get image_path(@image.id)

    assert_response :ok
    assert_select '#title', 'sydney'
  end
end
