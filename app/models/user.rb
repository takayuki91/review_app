class User < ApplicationRecord
  
  validates :name, presence: true, 
                     length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # rails側でセーブ前に小文字に
  before_save { self.email = self.email.downcase }
  validates :email, presence: true, 
                      length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                  uniqueness: true
                  # uniqueness: { case_sensitive: false }
                  
  has_secure_password
  validates :password, presence: true, 
                         length: { minimum: 6 }
  
end
