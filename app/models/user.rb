class User < ActiveRecord::Base
    has_many :tasks

    has_secure_password #activerecord macro; works with bcrypt(installed in Gemfile)
    # validates :name, presence: true
    validates :name, :email, presence: true
    validates :email, uniqueness: true
end