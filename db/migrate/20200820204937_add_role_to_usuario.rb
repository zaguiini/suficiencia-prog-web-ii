class AddRoleToUsuario < ActiveRecord::Migration[6.0]
  def change
    change_table :usuarios do |t|
      t.string :role
    end
  end
end
