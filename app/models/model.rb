class Model < ActiveRecord::Base
  belongs_to :make

  validates :name, presence: true
  validates :make, presence: true
end
