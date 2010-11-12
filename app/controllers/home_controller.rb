class HomeController < ApplicationController
  def index
    @good = Feedback.good
    @bad = Feedback.bad
  end
end
