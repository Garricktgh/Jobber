class AddApprovalsToStatuses < ActiveRecord::Migration[5.2]
  def change
    remove_column :statuses, :status, :text
    add_column :statuses, :post_approval, :text, default: "pending"
    add_column :statuses, :user_approval, :text, default: "pending"
  end
end
