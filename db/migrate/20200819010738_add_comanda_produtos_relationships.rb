class AddComandaProdutosRelationships < ActiveRecord::Migration[6.0]
  def change
    change_table :comanda_produtos do |t|
      t.belongs_to :produto
      t.belongs_to :comanda
    end
  end
end
