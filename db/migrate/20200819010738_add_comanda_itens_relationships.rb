class AddComandaItensRelationships < ActiveRecord::Migration[6.0]
  def change
    change_table :comanda_itens do |t|
      t.belongs_to :produto
      t.belongs_to :comanda
    end
  end
end
