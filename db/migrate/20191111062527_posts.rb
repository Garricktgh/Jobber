class Posts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :company
      t.text :job_title
      t.text :job_description
      t.string :employment_type
      t.string :industry
      t.string :work_experience
      t.string :education_level
      t.string :expected_salary
      t.timestamps
    end
  end
end