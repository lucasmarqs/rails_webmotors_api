class ModelsController < ApplicationController
  expose :make
  expose :models, from: :make

  def index; end
end
