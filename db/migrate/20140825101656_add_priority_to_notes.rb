class AddPriorityToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :priority, :integer, null: false, default: 0
  end
end
