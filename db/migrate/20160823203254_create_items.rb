class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :note
      t.boolean :done, default: false
      t.belongs_to :bucket

      t.timestamps
    end
  end
end
