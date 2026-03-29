class Link < ApplicationRecord

  validates :url_original, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp, message: "deve ser uma URL válida" }

  validates :url_short, uniqueness: true

  before_validation :generate_url_short, on: :create

  private
  def generate_url_short

    return if url_short.present?

    self.url_short = SecureRandom.alphanumeric(6)
    while Link.exists?(url_short: url_short)
      self.url_short = SecureRandom.alphanumeric(6)
    end
  end
end
