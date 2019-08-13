class Image < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  validate :validates_url

  private

  def validates_url
    url = resolve_url(text)
    errors.add(:text, 'Invalid URL') unless url.present?
  end

  def resolve_url(img_url)
    url = URI.parse(img_url)
    return url if url.host
  rescue URI::Error
  end
end
