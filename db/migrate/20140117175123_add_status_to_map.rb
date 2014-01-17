class AddStatusToMap < ActiveRecord::Migration
  def change
    add_column :maps, :status, :string, null: false, default: "utworzony"
    add_column :maps, :url, :string
  end
end
