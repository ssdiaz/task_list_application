class User < ActiveRecord::Base
    has_many :tasks

    #has_secure_password #activerecord macro; works with bcrypt(installed in Gemfile)
    
    #validates_uniqueness_of :username
end