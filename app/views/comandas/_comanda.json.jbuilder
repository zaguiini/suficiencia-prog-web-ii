json.id comanda.id

json.usuario do
  json.usuario_id comanda.usuario.id
  json.extract! comanda.usuario, :nome, :telefone
end

json.itens(comanda.itens) do |item|
  produto = item.produto

  json.item_id item.id
  json.produto_id produto.id
  json.nome produto.nome
  json.quantidade item.quantidade.to_i
  json.preco_unitario produto.preco.to_f
end
