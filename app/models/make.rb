class Make < ActiveRecord::Base
  has_many :models

  validates :name, presence: true
  validates :webmotors_id, presence: true, uniqueness: true
end
