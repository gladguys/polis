[![codecov](https://codecov.io/gh/rodrigobastosv/polis/branch/master/graph/badge.svg?token=LP0ITkj2H0)](https://codecov.io/gh/rodrigobastosv/polis)
[![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://github.com/tenhobi/effective_dart)

# Pólis

O Pólis foi idealizado para ser uma rede social "politizada", onde vai ser possivel acompanhar os políticos (inicialmente só deputados) desejados.

# Tecnologias e Libs
## Gerência de Estado
Para gerenciar o estado da aplicação utilizamos [flutter_bloc](https://pub.dev/packages/flutter_bloc).

## Backend
Utilizamos Firebase e vários de seus serviços como FirebaseAuth, Firestore e FirebaseStorage. Ainda utilizamos Cloud Functions que são nossas funções que fazem a extração dos dados da [API](https://dadosabertos.camara.leg.br/swagger/api.html) e jogam no banco Firestore do Firebase. Temos um scheduler que faz essa extração diariamente.

## Testes
Fazemos 4 tipos de testes:
* Teste de Bloc
* Teste de Widget
* Teste de Repository
* Teste de Cloud Functions

Utilizamos a própria SDK do Flutter para testes de Widget e de Repository, para testes de bloc utilizamos [bloc_test](https://pub.dev/packages/bloc_test). Para testar as Cloud Functions utilizamos ???

## Linting
Para lint do código utilizamos effective_dart.
