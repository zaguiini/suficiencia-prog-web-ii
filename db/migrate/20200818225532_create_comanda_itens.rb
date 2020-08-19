class CreateComandaItens < ActiveRecord::Migration[6.0]
  def change
    create_table :comanda_itens do |t|
      t.numeric :quantidade

      t.timestamps
    end
  end
end
