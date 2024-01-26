class AddStatusToArrangements < ActiveRecord::Migration[7.1]
  def change
    add_column :arrangements, :status, :string, default: "PENDING"
  end
end
