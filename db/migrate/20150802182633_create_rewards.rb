class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :name
      t.integer :cost, default: 0

      t.timestamps null: false
    end
  end
end
