class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :categories
  has_many :lists, through: :categories
  has_many :items, through: :lists

  # create default categories
  after_create :add_categories

  private
  def add_categories
    %w(Home Work).each do |name|
      c = self.categories.build
      c.name = name
      c.save
    end
  end
end
