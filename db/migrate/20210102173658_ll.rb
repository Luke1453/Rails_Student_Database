class Ll < ActiveRecord::Migration[6.0]
  def change
    create_table :grades do |t|
      t.column :grade_name, :string
      t.column :grade_year_t, :string
      t.column :grade_month_t, :string
      t.column :garde_day_t, :string
      t.column :grade_value, :int
      t.belongs_to :student

      t.timestamps
    end
  end
end
