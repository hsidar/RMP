class Raccoon < ActiveRecord::Base

  has_many :furnitures

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :claw_ferocity, presence: true, inclusion: (1..10).to_a
  validates :disposition, presence: true


  has_attached_file :avatar, :styles => { :medium => "500x500>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def avatar_url
    avatar.url(:medium)
  end

  def avatar_thumb
    avatar.url(:thumb)
  end

end
