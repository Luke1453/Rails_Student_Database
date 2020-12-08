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
  validates :p_id, presence: true
  validates :gender, presence: true
  validates :address, presence: true
  validates :phone_nr, presence: true
  validates :study_program, presence: true
  validates :study_type, presence: true
end
