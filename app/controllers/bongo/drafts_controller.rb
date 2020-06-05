module Bongo
  class DraftsController < ArticlesController
    def index
      @drafts = policy_scope(Article).not.published.order(updated_at: :desc)
    end
  end
end
