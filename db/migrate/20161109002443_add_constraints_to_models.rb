class AddConstraintsToModels < ActiveRecord::Migration
  def change
    change_column_null :models, :name, false
    change_column_null :models, :make_id, false

    add_index :models, :make_id
  end
end
