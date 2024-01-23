class AddSubjectToArrangements < ActiveRecord::Migration[7.1]
  def change
    add_column :arrangements, :subject, :text
  end
end
