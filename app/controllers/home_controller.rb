
class HomeController < ApplicationController
  def index
    @target = Target.new
  end
end
