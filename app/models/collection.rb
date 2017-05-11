# == Schema Information
#
# Table name: collections
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string(100)      not null
#  description :string(500)      default("")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_collections_on_user_id            (user_id)
#  index_collections_on_user_id_and_title  (user_id,title) UNIQUE
#

class Collection < ApplicationRecord

  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
  validates :title, uniqueness: { scope: :user_id, case_sensitive: false }
  validates :description, length: { maximum: 500 }

end
