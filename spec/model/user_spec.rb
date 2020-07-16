require 'rails_helper'

describe User do
it "should get the firstpart of email" do
  user = User.new(email:"someone@gmail.com")
expect(user.username).to eq("Someone")
end
end

