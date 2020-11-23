class Work < ApplicationRecord
  belongs_to :group, optional: true
  has_many  :users, through: :user_works


  with_options presence:  true do
    validates :contents
    validates :deadline
    validates :work_name
  end
end
