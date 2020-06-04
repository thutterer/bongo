module Bongo
  class Article
    include Mongoid::Document

    field :title, type: String
    field :text, type: String
    field :publish_at, type: Date

    scope :published, -> { where(:publish_at.lte => Date.today) }

    # Mongoid (v7.0.8) doesn't have a cache_version method on its document.
    # This causes https://jira.mongodb.org/browse/MONGOID-4680 when trying to
    # use Rails collection caching.
    def cache_version
      if respond_to?(:updated_at)
        updated_at.utc.to_s(:usec)
      else
        nil
      end
    end
  end
end
