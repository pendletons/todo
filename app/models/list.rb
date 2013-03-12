class List < ActiveRecord::Base
  belongs_to :category
  has_many :items, dependent: :destroy

  accepts_nested_attributes_for :items, reject_if: lambda { |i| i[:name].blank? }

  attr_accessible :category_id, :name, :items_attributes

  delegate :name, to: :category, prefix: true

  validates :category, :name, presence: true
  validates :name, length: { within: 3..25 }
  validate :minimum_items

  def minimum_items
    if self.items.length < 1
      self.errors[:base] << "A list must have at least one item."
    end
  end
end
