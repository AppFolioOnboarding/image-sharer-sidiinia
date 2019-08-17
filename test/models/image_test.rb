require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_image__valid_if_resource_is_image
    image = Image.new(title: 'image_example', text: 'https://data.whicdn.com/images/62682708/original.jpg')
    assert_predicate image, :valid?
  end

  def test_image__invalid_if_title_is_blank
    image = Image.new(title: '', text: 'https://data.whicdn.com/images/62682708/original.jpg')
    refute_predicate image, :valid?
    assert_equal "can't be blank", image.errors[:title].first
  end

  def test_image__invalid_if_text_is_blank
    image = Image.new(title: 'sydney', text: '')
    refute_predicate image, :valid?
    assert_equal "can't be blank", image.errors[:text].first

  end

  def test_image__invalid_if_url_is_invalid
    image = Image.new(title: 'sydney', text: 'www.notValidUrl.com')
    refute_predicate image, :valid?
    assert_equal "Invalid URL", image.errors[:text].first
  end
end
