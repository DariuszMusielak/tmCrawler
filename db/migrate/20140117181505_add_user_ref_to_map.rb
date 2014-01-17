class AddUserRefToMap < ActiveRecord::Migration
  def change
    add_reference :maps, :user, index: true
  end
end
