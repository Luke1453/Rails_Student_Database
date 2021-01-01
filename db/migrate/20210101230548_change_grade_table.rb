class ChangeGradeTable < ActiveRecord::Migration[6.0]
  def change
    create_table :grades do |t|

      t.column :grade_name, :string
      t.column :grade_date, :string
      t.column :grade_value, :int

      t.timestamps
    end

    

  end
end
