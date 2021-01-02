class Grade < ApplicationRecord
  belongs_to :student

  validates :grade_name, presence: true
  validates :grade_day_t, presence: true
  validates :grade_month_t, presence: true
  validates :grade_year_t, presence: true
  validates :grade_value, presence: true
end
