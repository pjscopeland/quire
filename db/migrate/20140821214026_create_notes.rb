class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :page, index: true, null: false
      t.text :content

      t.timestamps
    end
  end
end
