class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :satilans
  validates :username, presence: :true, uniqueness: { case_sensitive: false }

  attr_writer :login

  validate :validate_username

  def validate_username
  	if User.where(email: username).exists?
  		errors.add(:username, :invalid)
  	end
  end

  def login
  	@login || self.username || self.email
  end

  def soft_delete  
  	update_attribute(:is_deleted, true)  
  end  
  
  # ensure user account is active  
  def active_for_authentication?  
  	super && !is_deleted  
  end  
  
  # provide a custom message for a deleted account   
  def inactive_message   
  	!is_deleted ? super : :deleted_account  
  end  

  def self.search(keywords)
    user = order(:created_at)
    user = User.where("username like ? OR email like ?", "%#{keywords}%","%#{keywords}%") if keywords.present?
    user
  end

end
