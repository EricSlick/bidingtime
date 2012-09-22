class AddDefaultUserAndRole < ActiveRecord::Migration
  def up
    #password is admin
    role = Role.new(:name => "admin", :description => "Administrating site")
    role.save unless Role.where("name = ?", role.name).first
    role.errors.each do |error|
      puts "Error: #{error.inspect}"
    end
    role = Role.where("name = ?", "admin").first
    raise "Failed to create default admin ROLE" unless role
    puts "Success: Role #{role.name} created!"
    user = User.where("email = ?", "admin").first
    user = User.new(:email => "admin", :password => "admin") unless user
    user.role_id = role.id
    user.password_digest = "$2a$10$ad.xos9NXZTl8U4P6/QnxeOWzDL2RB6Zk6JiJWYmBKfx.ViDS.y6W"
    user.save
    user.errors.each do |error|
      puts "Error: #{error.inspect}"
    end
    user = User.where("email = ?", "admin").first
    raise "Failed to create the default admin USER" unless user
    puts "Success! User #{user.email} created!"
  end

  def down
  end
end
