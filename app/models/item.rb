class Item < ActiveRecord::Base
  PENDING = 0
  COMPLETED = 1
  DELETED = -1

  belongs_to :list
  acts_as_list scope: :list

  attr_accessible :list_id, :name, :status_id

  validates :name, presence: true
  validates :status_id, inclusion: { in: [PENDING, COMPLETED, DELETED] }

  default_scope order('position')

  def complete?
    status_id == COMPLETED
  end
end