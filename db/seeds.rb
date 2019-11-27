# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Methods to use in seeding

# Array of all roles
# ROLES = ["Admin", "User"]

# create the roles
# ROLES.each{|role| Role.find_or_create_by(name: role)}

# create default Super Admin
super_user = User.where(email: "test@anviam.com")
if !super_user.present?
 super_user = User.new(email: "test@anviam.com", password: "admin@123", role: "Admin")
 super_user.save(validate: false)
end


# Create users for each role
# Role.all.each_with_index do |role, index|
#  if !User.where(role: role).present?
#    i = index + 1
#    role_name = role.name.gsub(" ", "").downcase
#    for j in 1..(i*2)
#      user = User.new(email: "#{role_name}#{i}#{j}@anviam.com", password: "123456", name: "#{role_name}#{i}#{j}", role: role)
#      user.save(validate: false)
#    end
#  end
# end

for i in 1..15 do
  user_name = "user"
  user=User.new(email: "#{user_name}#{i}@anviam.com", password: "123456", role: "User")
  user.save(validate: false)
end