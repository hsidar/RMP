class User < ActiveRecord::Base

  has_many :raccoons

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :username, uniqueness: true

  before_create :init

  def init
    self.raccoon_limit = 0
  end


end
