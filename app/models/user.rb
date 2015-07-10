class User < ActiveRecord::Base

  has_many :raccoons

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :init
  def init
    self.raccoon_limit = 3
  end

end
