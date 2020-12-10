class Student < ApplicationRecord
  # attr_accessor :first_name,
  #               :last_name,
  #               :p_id,
  #               :gender,
  #               :address,
  #               :phone_nr,
  #               :study_program,
  #               :study_type

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :p_id, presence: true, numericality: { only_integer: true }
  validates :p_id, uniqueness: true
  validates :gender, presence: true
  validates :address, presence: true
  validates :phone_nr, presence: true
  validates :study_program, presence: true
  validates :study_type, presence: true
  validates :b_year, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 2020 }
  validates :b_month, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 12 }
  validates :b_day, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 31 }
end
