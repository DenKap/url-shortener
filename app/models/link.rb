require 'uri'

class Link < ApplicationRecord
  before_save :shortened_url

  validates :original_url, presence: true
  validates_format_of :original_url, with: URI::DEFAULT_PARSER.make_regexp, message: 'must be URL'

  private

  def shortened_url
    self.short_url = 6.times.map { [*'0'..'9', *'a'..'z'].sample }.join until Link.find_by_short_url(short_url).nil?
  end

end
