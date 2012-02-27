class Recruiter < ActiveRecord::Base
  
   has_many :employments
   has_many :companies, :through => :employments 
    def push_with_attributes(company, join_attrs)
      Employments.with_scope(:create => join_attrs) { self << company}
    end
  
   attr_accessible :username, :email, :password, :password_confirmation, :company

   attr_accessor :password
   before_save :encrypt_password

   validates_confirmation_of :password, :message => 'and Password confirmation do not match'
   validates_presence_of :password, :on => :create
   validates_presence_of :username
   validates_presence_of :email
   validates_uniqueness_of :email
   validates_format_of :email,
                      :with => /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}/i,
                      :message => "must be a valid address"
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
  
end
