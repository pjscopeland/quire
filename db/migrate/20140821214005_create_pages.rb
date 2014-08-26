class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, null: false

      t.timestamps

      t.index :title, unique: true
    end
  end
end
