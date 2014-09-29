class HomeController < ApplicationController
  def index
    flash['error'] = "test"
    if current_user
      # TODO dashboard info
    end
  end

  def about
  end

  def help
  end
end
