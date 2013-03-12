class List < ActiveRecord::Base
  belongs_to :category
  has_many :items, dependent: :destroy, order: :position

  accepts_nested_attributes_for :items, reject_if: proc { |i| i['name'].blank? }, allow_destroy: true

  attr_accessible :category_id, :name, :items_attributes

  delegate :name, to: :category, prefix: true

  validates :category, :name, presence: true
  validates :name, length: { within: 3..25 }
end
