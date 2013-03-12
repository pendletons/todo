class Category < ActiveRecord::Base
  belongs_to :user

  has_many :lists, dependent: :destroy
  has_many :items, through: :lists

  attr_accessible :name
end
