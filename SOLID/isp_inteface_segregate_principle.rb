# frozen_string_literal: true

# We use all these rules/principles/patterns to achieve some benefits, not just to fulfill/apply them.
# So if benefits aren't clear, applying rule will lead to nothing.

# For me, while we cannot actually break ISP rule in an obvious way,
# we can still get some benefits by fulfilling this principle on let's say - lower level.
# We will not be talking about implementing methods from interfaces in classes.
# We will discuss creating (good) method signatures. The method signature is part of a class interface, isn't it?

class PostRepository
  def get_all_by_ids(ids:)
    entity.where(id: ids)
  end

  private

  def entity
    Post
  end
end

module Admin
  class PostsController
    def index
      @posts = PostRepository.new.get_all_by_ids(params[:ids])
    end
  end
end

# Let's make things complicated a bit
class PostRepository
  def get_all_by_ids(ids:, sort:)
    posts = entity.where(id: ids)
    posts.order(title: :asc) if sort
    posts
  end

  private

  def entity
    Post
  end
end

# Where is the problem? Let's look on Admin::PostsController#index action.
# We are forced to start using new parameter although we don't need any sorting at all!
# So we depend on part of the interface which we don't need.

# You would say: Ok! Let's introduce default value for "sort" parameter in the method signature.
# I would say: Yes, it will do the job but is it not hiding some details?
# And what if we must introduce the third parameter? Then we will be forced to provide the second one explicitly.
module Admin
  class PostsController
    def index
      @posts = PostRepository.new.get_all_by_ids(params[:ids], false)
    end
  end
end

module Client
  class HomeController
    def index
      @posts = PostRepository.new.get_all_by_ids(params[:ids], true)
    end
  end
end

# One of the possible solutions is to split up this logic into two separate methods:
class PostRepository
  def get_all_by_ids(ids:)
    entity.where(id: ids)
  end

  def get_all_by_ids_sorted(ids:)
    get_all_by_ids(ids).order(title: :asc)
  end

  private

  def entity
    Post
  end
end

# Usage

module Admin
  class PostsController
    def index
      @posts = PostRepository.new.get_all_by_ids(params[:ids])
    end
  end
end

module Client
  class HomeController
    def index
      @posts = PostRepository.new.get_all_by_ids_sorted(params[:ids])
    end
  end
end
