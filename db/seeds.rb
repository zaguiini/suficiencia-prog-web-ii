# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Usuario.create(nome: 'Zé', email: 'ze@lanchonete.com', password: '123456', telefone: '47999999999', role: :customer)
Usuario.create(nome: 'Maria', email: 'maria@lanchonete.com', password: '123456', telefone: '47988888888', role: :customer)

Usuario.create(nome: 'Gerente', email: 'gerente@lanchonete.com', password: '123456', telefone: '47900000000', role: :admin)

Produto.create(nome: 'X-Salada', preco: 7)
Produto.create(nome: 'X-Bacon', preco: 9)
