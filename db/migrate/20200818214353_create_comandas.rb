class CreateComandas < ActiveRecord::Migration[6.0]
  def change
    create_table :comandas do |t|
      t.belongs_to :usuario
      t.timestamps
    end
  end
end
