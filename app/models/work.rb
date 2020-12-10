class Work < ApplicationRecord
  belongs_to :group, optional: true

  with_options presence:  true do
    validates :contents
    validates :work_name
    validates :progress
  end

  validates :progress, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to:100 }
  validate :deadline_check

  def deadline_check
    errors.add(:deadline, "is already passed or is blank.") if deadline.blank? || deadline < Date.today
  end
  
end
