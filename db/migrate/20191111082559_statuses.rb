class Statuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.references :user
      t.references :post
      t.text :status
      t.timestamps
    end
  end
end