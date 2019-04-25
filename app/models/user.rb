class User < ApplicationRecord
  
  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

    has_many :ideas, dependent: :nullify
    has_many :created_ideas, dependent: :nullify
  
     has_secure_password  
     validates(:email, presence: true, uniqueness: true, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
      
     def full_name
      "#{first_name} #{last_name}".strip
    end
  end