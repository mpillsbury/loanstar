class User < ActiveRecord::Base
  attr_accessible :email, :password, :display_name

  validates :email, :display_name, presence: true
  validates_uniqueness_of :email, :display_name

  has_many :items, dependent: :destroy
  has_many :borrows, dependent: :destroy

  def as_json options = {}
    {
      userId: id,
      email: email,
      hashedPassword: password,
      displayName: display_name
    }

  end
end
