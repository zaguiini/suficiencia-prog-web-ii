class AddComandaItensObservacoesEPrecoCustomizado < ActiveRecord::Migration[6.0]
  def change
    change_table :comanda_itens do |t|
      t.string :observacoes
      t.numeric :preco
    end
  end
end
