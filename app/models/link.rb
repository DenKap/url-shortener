require 'uri'

class Link < ApplicationRecord
  before_save :shortened_url

  validates :original_url, presence: true, :format => {:with => URI.regexp}

  private

  def shortened_url
    self.slug = 6.times.map { [*'0'..'9', *'a'..'z'].sample }.join
  end

end
