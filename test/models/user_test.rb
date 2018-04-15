require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
	  @user = User.new(name:"Eample User", email:"user@example.com", password: "foobar", password_confirmation: "foobar")
	end

 test "email validation shoule accept valid addreses" do 
	 valid_addresses = %w[user@example,com U*S~ER@foo.COM A_US-ER_foo.bar.org first.lastfoo.jp alice+bob@baz,cn]


	 valid_addresses.each do |valid_address|
		 @user.email = valid_address
		 assert_not @user.valid?, "#{valid_address.inspect} should be valid"
	 end
 end

 test "authenticated? should return false for a user with a nil digest" do
  assert_not @user.authenticated?('')
end

end

