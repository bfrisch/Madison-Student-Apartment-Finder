# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  Name               :string(255)
#  Email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean         default(FALSE)
#

class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  attr_accessible :Name, :Email, :password, :password_confirmation
    
  #ensures that emails follow the pattern of an email.. ie. 'aeggum@wisc.edu'
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
  validates :Name, :presence => true,
                   :length => { :maximum => 50 }
  validates :Email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
                    
  # Automatically create the virtual attribute 'password_confirmation'.
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 8..40 }
  
  before_save :encrypt_password 
  
  # Return true if the user's password matches the submitted password.
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    puts email; puts submitted_password;
    user = find_by_Email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end


           
  private 
  
    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
  
  
end