json.id comanda.id

json.usuario { json.extract! comanda.usuario, :id, :nome, :telefone }

json.produtos(comanda.comanda_produtos) do |comanda_produto|
  produto = comanda_produto.produto

  json.id comanda_produto.id

  json.nome produto.nome
  json.quantidade comanda_produto.quantidade.to_i
  json.preco_unitario produto.preco.to_f
end
