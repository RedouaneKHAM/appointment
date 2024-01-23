class CreateAgents < ActiveRecord::Migration[7.1]
  def change
    create_table :agents do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
