class MakesController < ApplicationController
  expose :makes, -> { Make.all.order(:name) }

  def index; end
end
