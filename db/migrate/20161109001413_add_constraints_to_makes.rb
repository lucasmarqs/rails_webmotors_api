class AddConstraintsToMakes < ActiveRecord::Migration
  def change
    change_column_null :makes, :name, false
    change_column_null :makes, :webmotors_id, false

    add_index :makes, :webmotors_id, unique: true
  end
end
