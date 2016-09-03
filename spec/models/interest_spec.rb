require 'rails_helper'

describe "interest model" do
  let(:user) { User.create!(username:"jay", email:"jay@gmail.com", password: "1234") }
  let(:interest) { Interest.create(name: "Sports") }
  let(:saved_interest) { Interest.find_by(name: "Sports")}

  it "has a name" do
    expect(interest.name).to eq saved_interest.name
  end

  it "can find an interest by name" do
    expect(Interest.find_by(name: "Sports")).to eq saved_interest
  end

  it "can edit a student user" do
    interest.update_attributes(name: "Music")
    expect(interest.name).to eq "Music"
  end

  it "can add an interest to a user" do
    user.interests.create(name: interest.name)
    expect(user.interests.first.name).to eq interest.name
  end
end
