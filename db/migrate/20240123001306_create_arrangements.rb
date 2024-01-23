class CreateArrangements < ActiveRecord::Migration[7.1]
  def change
    create_table :arrangements do |t|
      t.datetime :date
      t.references :agent, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
