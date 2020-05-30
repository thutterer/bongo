module Bongo
  class ArticlePolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        if user&.admin?
          scope.all
        else
          scope.published
        end
      end
    end

    def show?
      true
    end

    def create?
      user&.admin?
    end

    def update?
      user&.admin?
    end

    def destroy?
      user&.admin?
    end
  end
end
