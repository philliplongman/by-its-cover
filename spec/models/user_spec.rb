require 'rails_helper'

describe User do

  it { should have_one :profile }
  it { should have_many :collections }

  it { should validate_presence_of :email }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of :password }

  it 'validates email' do
    should have_valid(:email).when('testuser@email.com', 'taco@gmail.com')
    should_not have_valid(:email).when(nil, '', 'taco', 'taco@gmail', 'taco.com')
  end

  it 'has a matching confirmation for the password' do
    user = User.new
    user.password = "password"
    user.password_confirmation = "typo"

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end

end
