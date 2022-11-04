## Monólito:
    - "obra construída em uma só pedra"
    - todo o seu sistema está em um único codigo fonte e obrigatoriamente em um unico server
    - Benefícios: 
      - Ágil
      - menor complexidade
    - Desvantagem
      - Manutenção
      - Escalabilidade
      - Complexidade
  
## Sistemas em 2 Camadas
    - Front-end
    - Backend
      - Web Service (SOAP)
      - Rest Service


## Micro Service
    - consiste na quebra do monolito em várias aplicações completas pequenas e independentes
    - Beneficios
      - facil entendimento e desenvolvimento do proj
      - facil e rapida implantacao (build e deploy)
      - possibilidade de aplicar a melhor ferramenta para um determinado trabalho
    - Desvantagens
      - dificuldade em implantar e operar sistemas distribuídos


## Webservice Restfull
    - este tipo de servico nao mantem estado, entao ele:
      - inicia
      - exe
      - finish
    - metodos http
    - cada metodo tem sua url

- inversão de controle: em vez de instanciar a classe, requisitamos a um gerenciador as instancias quando precisamos.

## Arquitetura Backend
- será um monolito 

- usaremos o server-shelf 
  - dart create -t server-shelf ./nome_projeto