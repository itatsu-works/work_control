class Work < ApplicationRecord
  belongs_to :group, optional: true
  has_many  :users, through: :user_works


  with_options presence:  true do
    validates :contents
    validates :work_name
  end
  validate :deadline_check

  def deadline_check
    errors.add(:deadline, "is already passed or is blank.") if deadline.blank? || deadline < Date.today
  end
  
end
