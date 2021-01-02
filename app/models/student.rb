# frozen_string_literal: true

# Student Model
class Student < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :p_id, presence: true, numericality: { only_integer: true }
  validates :p_id , length: { is: 11 }
  validates :gender, presence: true
  validates :address, presence: true
  validates :phone_nr, presence: true
  validates :study_program, presence: true
  validates :study_type, presence: true
  validates :b_year, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 2021 }
  validates :b_month, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 12 }
  validates :b_day, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 31 }

  # custom validations
  validate :gender_personal_id
  validate :phone_validity
  validate :p_id_validity

  has_many :grades

  private

  # check whether the gender coincides with the one in the personal identification code
  def gender_personal_id
    p_id_first = p_id.to_s[0, 1].to_i

    if gender == 'Male' && p_id_first.even?
      errors.add(:gander, 'dosent match the one in personal ID')
    elsif gender == 'Female' && p_id_first.odd?
      errors.add(:gander, 'dosent match the one in personal ID')
    end
  end

  # check whether the phone number entered is valid
  def phone_validity
    phone_length = phone_nr.length
    first4 = phone_nr.to_s[0, 4]
    first = phone_nr.to_s[0, 1]
    case phone_length
    when 12
      errors.add(:phone_nr, 'is invalid (+370 length = 12)') unless first4 == '+370'
    when 9
      errors.add(:phone_nr, 'is invalid (8 length = 9)') unless first == '8'
    else
      errors.add(:phone_nr, 'is invalid')
    end
  end

  # check whether the personal code is valid
  def p_id_validity
    # checking century
    century = century_from_year(b_year)
    case p_id[0, 1].to_i
    when 1
      unless century == 19 && gender == 'Male'
        errors.add(:p_id, "is invalid #{century} #{p_id[0, 1]} #{gender} (century and gender)")
      end
    when 2
      unless century == 19 && gender == 'Female'
        errors.add(:p_id, "is invalid #{century} #{p_id[0, 1]} #{gender}(century and gender)")
      end
    when 3
      unless century == 20 && gender == 'Male'
        errors.add(:p_id, "is invalid #{century} #{p_id[0, 1]} #{gender}(century and gender)")
      end
    when 4
      unless century == 20 && gender == 'Female'
        errors.add(:p_id, "is invalid #{century} #{p_id[0, 1]} #{gender}(century and gender)")
      end
    when 5
      unless century == 21 && gender == 'Male'
        errors.add(:p_id, "is invalid #{century} #{p_id[0, 1]} #{gender}(century and gender)")
      end
    when 6
      unless century == 21 && gender == 'Female'
        errors.add(:p_id, "is invalid #{century} #{p_id[0, 1]} #{gender}(century and gender)")
      end
    else
      errors.add(:p_id, "is invalid #{century} #{p_id[0, 1]} #{gender} (century...)")
    end

    # checking date
    year_last2 = b_year.to_s[2, 2]
    p_id_year = p_id[1, 2]
    p_id_month = p_id[3, 2]
    p_id_day = p_id[5, 2]

    b_day_str = if b_day.to_s.length == 1
                  '0' + b_day.to_s
                else
                  b_day.to_s
                end

    b_month_str = if b_month.to_s.length == 1
                    '0' + b_month.to_s
                  else
                    b_month.to_s
                  end

    errors.add(:p_id, "is invalid #{year_last2} (year dosent match)") unless year_last2 == p_id_year
    errors.add(:p_id, "is invalid #{b_month} (month dosent match)") unless b_month_str == p_id_month
    errors.add(:p_id, "is invalid #{b_day} (day dosent match)") unless b_day_str == p_id_day

    # checking checksum
    checksum = p_id.last.to_i
    p_id_arr = p_id[0, 10].split('')
    s = 0

    p_id_arr.each_with_index do |c, i|
      multiplier = i + 1
      s += if multiplier == 10
             c.to_i
           else
             c.to_i * multiplier
           end
    end

    reminder = s % 11

    if reminder != 10
      errors.add(:p_id, "is invalid (checksum)1 #{reminder} #{checksum}") unless reminder == checksum
    else

      # calculating new sum with coefficients
      s = 0

      p_id_arr.each_with_index do |c, i|
        multiplier = i + 3
        s += if multiplier == 10
               c.to_i
             elsif multiplier == 11
               c.to_i * 2
             elsif multiplier == 12
               c.to_i * 3
             else
               c.to_i * multiplier
             end
      end

      reminder = s % 11

      if reminder != 10
        errors.add(:p_id, "is invalid (checksum)2 #{reminder} #{checksum}") unless checksum == reminder
      else
        errors.add(:p_id, "is invalid (checksum)3 #{reminder} #{checksum}") unless checksum.zero?
      end

    end
  end

  def century_from_year(year)
    if (year % 100).zero?
      year / 100 + 1
    else
      (year - (year % 100)) / 100 + 1
    end
  end
end
