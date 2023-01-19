# packages
- stagehand: dart package. é como um templates que projetos simples em dart. comando: dart pub global activate stagehand. descontinuado. usar o **dart create**
- dotenv: controlar as variaveis de ambiente
- mysql1
- get_it : ver os exemplos
  - // deve rodar o ->> flutter pub run build_runner watch ou flutter pub run build_runner watch --delete-conflicting-outputs
- logger
- injectable: para não ficar configurando class por class, basta apenas uma pequena anotação para tudo dá certo
- build_runner: tem comando abaixo
- shelf e 
- shelf_router: gerenciador de rotas
  - `fu-shelfcontroller`
- jaguar_jwt: ^3.0.0 --- cuida do JWT
- 

# Conceitos
> Middleware
- é um interceptor, ou seja, temos algo rodando entre as nossas requisições. ele é executado antes e após a requisição
- pipeline: são processos dentro do shelf

> Middleware de CORS:
- CORS quer dizer cross domain(dominio cruzado), ou seja, interligação de dominio diferentes.
- no mobile não temos muito este problema, mas no web sim, ou seja, se estou em um domínio e tento acessar um outro dominio, o browser vai fazer uma checagem e verificar se eu posso acessar aquele domínio por segurança.
- lembrando: essa checagem é feita pelo BROWSER, no mundo mobile não é necessário. mas por prevencao caso queira algo web acessando o back...
- a segurança aqui é sempre feito pelo client 
- essa verificação de acesso positivo ou negativo se dá por meio de alguns headers especificos, que vai dizer para o browser se pode ou não acessar. 
  - quando se tenta acesso a servvicos de dominio diferentes, ele faz sempre duas requisiçoes:
    - 1: OPTIONS - momento da validacao, verifica se pode acessar o dominio ou nao e esse option responde com alguns headers especificos e o browser faz essa checagem 
    - 2: caso sim: faz a requisição de verdade, GET PUT... 
- headers: 
  - Access-Control-Allow-Origin: qual a origem que aceita receber requisicoes
  - Access-Control-Allow-Methods: metodos
  - Access-Control-Allow-Header: quais os parametros q o servidor aceita receber
  - 

## JWT
- json web token
- define uma forma compacta e segura e independente para transmitir infor entre objetos json
- podem ser assinado com um segredo  (algoritmo hmac) ou par de chaves pública/privada usando RSA ou ECDSA
- AUTORIZAÇÃO: depois de conectado, cada requisicao do usuario  terá o jwt, permitindo que   o user acesse rotas e serviços e recursos permitidos com esse token.
- SINGLE SIGN ON: recurso que vc faz login uma unica vez e vc utiliza este mesmo login em todas as aplicacoes . 
- ESTRUTURA JWT
  - Header: normalmente tem duas partes o tipo do token q é o jwt e o algoritmo de assinatura (hmac, sha256, rsa). então é passado para o Base64Url para formar a 1 parte
   ```
    {
      "alg":"HS256",
      "typ":"JWT"
    }
    ```
  - Payload: são declaraões sobre entidades, usuarios, dados adicionais. nao sao obrigatorias.
  ```
  {
    "sub":"21212",
    "name":"John DOe",
    "admin":true
  }
  ```
  - Signature: parte mais importante. ela que vai validar, vai gerar uma hash unica para o nosso sistema. é a soma das partes codificadas, Signature = Algoritmo de hash(Base64Url(header) + Base64Url(payload) + senha secreta)
  - exemplo avsoinvoaisnd.vaçosdnvoasndvonasodivnoasid.vaosidnvoansdovnoasdinv

# launch.json
```
"program": "${worlspaceFolderBasename}/bin/server.dart"
```

# Variaveis de Ambiente
- para segurança as info devem ser armazenadas  na maquina.
- possibilide de buscar as variaves da maquina
- deve criar um arquivo .env


# Banco:
- usando docker
- My SQL
- hub.docker.com

```
docker-compose up
```

- build_runner
```
dart run build_runner watch
```