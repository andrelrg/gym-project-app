import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_project/domains/usuario.dart';
import 'package:http/http.dart'as http;

class RegistrationForm extends StatefulWidget {
  final Usuario user;


  const RegistrationForm(this.user);
  @override
  RegistrationFormState createState() {
    return RegistrationFormState(this.user);
  }
}


class RegistrationFormState extends State<RegistrationForm> {

  final _formKey = GlobalKey<FormState>();
  final Usuario user;
  TextEditingController celular = TextEditingController();
  TextEditingController cep = TextEditingController();
  TextEditingController rua = TextEditingController();
  TextEditingController numero = TextEditingController();
  TextEditingController cidade = TextEditingController();
  TextEditingController estado = TextEditingController();
  TextEditingController genero = TextEditingController();
  TextEditingController objetivo = TextEditingController();

  RegistrationFormState(this.user);

  get name => this.user.name;
  get email => this.user.email;

  @override
  Widget build(BuildContext context) {

    return new ListView(
      reverse: true,
      children: <Widget>[
        // put your text fields here
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: new NetworkImage(user.photoUrl),
                  radius: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical:10.0),
                  child: Text.rich(
                    TextSpan(
                      text: "$name, preencha algumas informações e sua conta estará criada!",
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Celular'
                  ),
                  controller: celular,
                  keyboardType: TextInputType.phone,
                  maxLength: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'CEP'
                  ),
                  controller: cep,
                  keyboardType: TextInputType.number,

                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Rua'
                  ),
                  controller: rua,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Numero'
                  ),
                  controller: numero,
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Cidade'
                  ),
                  controller: cidade,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Estado'
                  ),
                  controller: estado,
                ),
                DropdownButtonFormField(
                  items: <DropdownMenuItem<String>>[
                    new DropdownMenuItem<String>(value: "male", child: new Text("Masculino")),
                    new DropdownMenuItem<String>(value: "female", child: new Text("Feminino")),
                  ],
                  decoration: InputDecoration(
                      labelText: 'Gênero'
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Objetivo'
                  ),
                  controller: objetivo,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context)
                            .showSnackBar(
                            SnackBar(content: Text('Salvando dados')));
                          var httpClient = new http.Client();
                          List<String> names = name.split(" ");
                          var fname = names[0];
                          var lname = names[1];
                          var celular = this.celular.text;
                          var cep = this.cep.text;
                          var rua = this.rua.text;
                          var numero = this.numero.text;
                          var cidade = this.cidade.text;
                          var estado = this.estado.text;
                          var genero = this.genero.text;
                          var objetivo = this.objetivo.text;
                          httpClient.post(
                              Uri.encodeFull('localhost:8080/criarUsuario'),
                              body:"""
                                {
                                  "nome": $fname,
                                  "sobrenome": $lname,
                                  "email": $email,
                                  "senha": "0000",
                                  "telefone": $celular,
                                  "rua": $rua,
                                  "numero": $numero,
                                  "cep": $cep,
                                  "cidade": $cidade,
                                  "estado": $estado,
                                  "sexo": $genero,
                                  "objetivo": $objetivo,
                                  "peso": 60,
                                  "altura": 170,
                                  "tipo": "aluno",
                                  "med_braco_direito": 0,
                                  "med_braco_esquerdo": 0,
                                  "med_perna_direita": 0,
                                  "med_perna_esquerda": 0,
                                  "med_peito": 0,
                                  "med_abdomen": 0
                                }
                        """
                          );
                          Navigator.pushReplacementNamed(
                              context,
                              '/list',
                              arguments: Usuario(user.email, user.photoUrl, user.name)
                          );
                        }
                    },
                    child: Text('Salvar'),
                  ),
                ),
              ],
            )
        )
      ].reversed.toList(),
    );
  }
}
