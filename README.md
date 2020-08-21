# API de Suficiência em Programação Web II

Feita com Ruby on Rails.

## Como executar

Clone o repositório.

### Via Docker

Apenas rode `docker-compose up --build` na raiz e a API deverá funcionar corretamente na porta `8080`

### Localmente

É um aplicativo Ruby on Rails comum, então se certifique de ter a versão 2.6.5 do Ruby. Rode os seguintes passos na raiz:
- `bundle install`;
- `rails db:create`;
- `rails db:migrate`;
- `rails db:seed`;
- `rails s`.

Também na porta `8080`.

## Swagger

Na rota `http://localhost:8080/api-docs` ou em `./swagger/v1/swagger.yaml`.

## Notas

- Eu não fiz exatamente como foi pedido. Utilizei de minha experiência em construção de APIs para melhores tomadas de decisão;
- A API tem um sistema de funções no qual o usuário Gerente tem permissões totais (admin) enquanto outros usuários cadastrados tem função de cliente (customer);
- Nessa função cliente apenas é possível operar sobre as comandas na qual o cliente gerencia (ex.: cria, vê, modifica e apaga apenas as dele);
- Quando você cria uma comanda, o preço atual do produto é copiado e salvo no item da comanda. Isso previne que no futuro o preço do produto mude e acabe mudando em todas as comandas que aquele produto está incluído. Fora isso, é possível também especificar um preço customizado junto com possíveis observações em cada item da comanda;
- Está muito bom. Eu poderia fazer algumas melhorias mas o tempo ficou curto. Difícil conciliar trabalho, faculdade e projeto de suficiência. Se tivesse mais tempo teria mais cuidado com alguns modelos de requisição e resposta e implementaria uma solução melhor em relação às tarefas de cada usuário no sistema, além de realizar testes unitários para garantir o fluxo esperado.

Em caso de qualquer dúvida, por favor me contate pelo e-mail da Furb. Obrigado!
