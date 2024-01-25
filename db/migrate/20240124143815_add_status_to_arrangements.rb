class AddStatusToArrangements < ActiveRecord::Migration[7.1]
  def change
    add_column :arrangements, :status, :integer, default: 0
  end
end
