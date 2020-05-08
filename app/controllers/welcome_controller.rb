class WelcomeController < ApplicationController
  def index
    if current_user
      user_tutorials
    else
      visitor_tutorials
    end
  end

  private

  def user_tutorials
    @tutorials = if params[:tag]
                   Tutorial.tagged_with(params[:tag])
                           .paginate(page: params[:page], per_page: 5)
                 else
                   Tutorial.all.paginate(page: params[:page], per_page: 5)
                 end
  end

  def visitor_tutorials
    @tutorials = if params[:tag]
                   Tutorial.where(classroom: false).tagged_with(params[:tag])
                           .paginate(page: params[:page], per_page: 5)
                 else
                   Tutorial.where(classroom: false)
                           .paginate(page: params[:page], per_page: 5)
                 end
  end
end
