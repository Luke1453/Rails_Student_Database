class UpdateGradeTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :grades, :garde_day_t, :grade_day_t
  end
end
