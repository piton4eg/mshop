class StaticPagesController < ApplicationController
  skip_before_filter :authorize

  def about
  end

  def contact
  end
end
