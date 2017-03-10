require 'rails_helper'

describe Profile do

  it { should belong_to :user }

  it { should validate_presence_of :username }
  it { should validate_length_of(:username).is_at_most 25 }
  it { should allow_value(nil).for :gender }
  it { should validate_inclusion_of(:gender).in_array Profile::GENDERS }

  describe "validates uniqueness of username" do
    subject { create(:user).profile }
    it { should validate_uniqueness_of(:username).case_insensitive }
  end

  it "validates birth date" do
    should have_valid(:birthday).when(
      Date.today - 130.years, Date.today, nil
    )
    should_not have_valid(:birthday).when(
      Date.yesterday - 130.years, Date.tomorrow, "string", 100
    )
  end

end
