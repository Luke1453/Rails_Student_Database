class RecreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :p_id, :string
      t.column :gender, :string
      t.column :b_year, :int
      t.column :b_month, :int
      t.column :b_day, :int
      t.column :address, :string 
      t.column :phone_nr, :string
      t.column :study_program, :string
      t.column :study_type, :string
    end
  end
end
