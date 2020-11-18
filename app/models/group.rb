class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :works

  validates :group_name,  presence: true

end
