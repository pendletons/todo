class Item < ActiveRecord::Base
  PENDING = 0
  COMPLETED = 1
  DELETED = -1

  attr_accessible :list_id, :name, :status_id

  validates :name, presence: true
end
