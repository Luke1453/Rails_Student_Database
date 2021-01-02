class Grade < ApplicationRecord
  belongs_to :student

  validates :grade_name, presence: true
  validates :grade_day_t, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 31 }
  validates :grade_month_t, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 12 }
  validates :grade_year_t, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 2021 }
  validates :grade_value, presence: true, numericality: { only_integer: true}
end
