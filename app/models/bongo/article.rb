module Bongo
  class Article
    include Mongoid::Document

    field :title, type: String
    field :text, type: String
    field :publish_at, type: Date

    scope :published, -> { where(:publish_at.lte => Date.today) }
  end
end
