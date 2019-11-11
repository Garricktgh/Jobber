class AddMoreColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :display_picture, :text
    add_column :users, :employment_type, :string
    add_column :users, :industry, :string
    add_column :users, :work_experience, :string
    add_column :users, :education_level, :string
    add_column :users, :expected_salary, :string
  end
end
