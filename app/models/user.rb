class User < ActiveRecord::Base
    has_many :tasks

    has_secure_password 
    validates :name, :email, presence: true
    validates :email, uniqueness: true
end