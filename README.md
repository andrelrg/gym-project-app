# gym-project-app

Projeto desenvolvido para a disciplina Engenharia de software 2.
``` 
Alunos: 
André Gaspar
Matheus Melo 
```

# Informações
Aplicativo desenvolvido com flutter, tecnologia de desenvolvimento híbrido da google
Integração com firebase, utilizado para autenticação.<br><br>
**Referencias**:<br>
Flutter Docs: https://flutter.dev/docs<br>
Firebase integration Docs: https://firebase.google.com/docs/flutter/setup<br>

# Arquitetura
Para o desenvolvimento do projeto, foi criada uma escrutura baseada em controllers e forms, utilizado a metodologia de rotas do flutter.<br>
O código desenvolvido está em main.dart (gym-project/lib), onde são declaradas as rotas:<br>
```dart
routes: {
    '/home': (context) => new MyHomePage(title: 'Gym Project'),
    '/register': (context) => new Registration(),
    '/list': (context) => new ExerciseList(),
}
```
As rotas seguem para os *controllers*, onde são feitos os tratamento de dados e são alocados os serviços, caso seja um form, o controller vai invoca-lo da pasta *forms*, caso o objetivo da rota seja a invocação de um serviço, tal estará na pasta *services*.

# Firebase
Do firebase esta sendo usanda a camada de autenticação e identificação do usuário, pela integração com o Google authentication.
```dart
await auth.signInWithGoogle().then((FirebaseUser user) =>...)
```

# Prototipagem
Este projeto se trata de um protótipo, portanto está consumindo (para a área de listagem de exercícios), um mock de dados em JSON, que se encontra na pasta *asserts*.

# Rotas
`/home`: A rota home, cria a pagina inicial com o botão de login e o título do projeto, e invoca o serviço do firebase google authentication.<br>
`/register`: Chama o form de criação das informações do usuário, que ao terminar, chama a API externa do projeto.<br>
`/list`: Lê do mockfile os exercícios, e cria uma listagem com todas asedições de layout necessárias.