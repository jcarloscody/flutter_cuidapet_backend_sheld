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

# Conceitos
> Middleware
- é um interceptor, ou seja, temos algo rodando entre as nossas requisições. ele é executado antes e após a requisição
- pipeline: são processos dentro do shelf


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