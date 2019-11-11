class Reject < ActiveRecord::Migration[5.2]
  def change
    create_table :rejects do |t|
      t.references :user
      t.references :post
      t.timestamps
    end
  end
end