require 'rails_helper'

describe "user model" do
  let(:user) { User.create!(username:"jay", email:"jay@gmail.com", password: "1234") }
  let(:user2) { User.create!(username:"jess", email:"jess@gmail.com", password: "password") }
  let(:saved_user) { User.find_by(username:"jay") }
  let(:saved_user2) { User.find_by(username:"jess") }

  it "has a username" do
    expect(user.username).to eq saved_user.username
  end

  it "has an email" do
    expect(user.email).to eq saved_user.email
  end

  it "has a secure password" do
    expect(user.password).to_not eq saved_user.password
  end

  it "can find a student user" do
    expect(User.find_by(email: "jay@gmail.com")).to eq saved_user
  end

  it "can edit a student user" do
    user.update_attributes(email: "jay@me.com")
    expect(user.email).to eq "jay@me.com"
  end

end
