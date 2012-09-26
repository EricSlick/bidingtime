class User < ActiveRecord::Base
  has_one :role
  has_secure_password
  attr_accessible :email, :password_confirmation, :login, :password
  validates_presence_of :password, :on => :create

  def role
    return "guest" if role_id.nil?
    @role ||= Role.find(role_id)
    return @role.name
  end
end
