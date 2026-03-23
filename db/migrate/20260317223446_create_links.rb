class CreateLinks < ActiveRecord::Migration[8.1]
  def change
    create_table :links do |t|
      t.string :url_original, null: false
      t.string :url_short, null: false
      t.integer :clicks_count, default: 0, null: false

      t.timestamps
    end

    add_index :links, :url_short, unique: true
  end
end
