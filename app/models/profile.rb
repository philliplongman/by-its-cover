# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#  picture    :string
#  gender     :string
#  birthday   :date
#  location   :string
#
# Indexes
#
#  index_profiles_on_user_id   (user_id)
#  index_profiles_on_username  (username) UNIQUE
#

class Profile < ApplicationRecord

  belongs_to :user

  GENDERS = [
    "Man", "Woman", "Trans Man", "Trans Woman", "Other/Non-Conforming"
  ]

  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :username, length: { maximum: 25 }
  validates :gender,   inclusion: { in: GENDERS, allow_blank: true }
  validates :birthday, timeliness: {
    between: [lambda { Date.current - 130.years }, lambda { Date.current }],
    type: :date, allow_blank: true
  }


end
