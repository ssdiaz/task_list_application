class User < ActiveRecord::Base
    has_many :tasks
    #validates_associated :tasks

    #has_secure_password #activerecord macro; works with bcrypt(installed in Gemfile)
    

    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true
end