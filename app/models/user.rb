class User < ActiveRecord::Base
  attr_accessible :email, :password, :display_name

  validates :email, :password, :display_name, presence: true
  validates_uniqueness_of :email, :display_name

  has_many :items, dependent: :destroy
end