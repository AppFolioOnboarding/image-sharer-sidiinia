require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @image = Image.create!(title: 'sydney', text: 'http://blog.bongiovi.tw/wp-content/uploads/2015/03/03.jpg',
                           tag_list: 'random')
  end

  def test_index
    get images_path

    assert_response :ok
    assert_select 'h1', 'Listing images'
    assert_equal 'sydney', @image.title
    assert_equal 'http://blog.bongiovi.tw/wp-content/uploads/2015/03/03.jpg', @image.text
    assert_equal 'random', @image.tag_list.first
  end

  def test_index__filtered_by_tag
    @image = Image.create!(title: 'sidiinia', text: 'https://i.pinimg.com/originals/82/ef/06/82ef06c683aaa4a2e4782fc9af498416.png',
                           tag_list: 'cute')

    get images_path(tag: 'cute')

    assert_response :ok
    assert_select '.image', 1
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
