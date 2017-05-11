# frozen_string_literal: true

require "rails_helper"

describe Collection do

  it { should belong_to :user }

  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most 100 }
  it { should validate_length_of(:description).is_at_most 500 }

  describe "validates uniqueness of title" do
    subject { create :collection }
    it { should validate_uniqueness_of(:title).case_insensitive.scoped_to(:user_id) }
  end

end
