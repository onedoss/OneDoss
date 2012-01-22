class User < ActiveRecord::Base

   attr_accessible :username, :email, :password, :password_confirmation

   attr_accessor :password
   before_save :encrypt_password

   validates_confirmation_of :password, :message => 'and Password confirmation do not match'
   validates_presence_of :password, :on => :create
   validates_presence_of :username
   validates_presence_of :email
   validates_uniqueness_of :email
   validates_uniqueness_of :username

   def self.authenticate(username, password)
      user = find_by_username(username)
      if user && user.passwordHash == BCrypt::Engine.hash_secret(password, user.passwordSalt)
         user
      else
         nil
      end
   end
   
   def encrypt_password
      if password.present?
         self.passwordSalt = BCrypt::Engine.generate_salt
         self.passwordHash = BCrypt::Engine.hash_secret(password, passwordSalt)
      end
   end

   has_many :resumes
end
