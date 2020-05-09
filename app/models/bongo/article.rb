module Bongo
  class Article
    include Mongoid::Document

    field :title, type: String
    field :text, type: String
    field :publish_at, type: Date
  end
end
