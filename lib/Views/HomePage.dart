import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapibloc/rules/BusinessLogicBloc.dart';
import 'package:flutterapibloc/Components/TextFieldADD.dart';
import 'package:flutterapibloc/models/CepModel.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var maskFormatter = new MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});
  BusinessLogicBloc bloc = BusinessLogicBloc();
  TextEditingController campoLogradouro = TextEditingController();
  TextEditingController campoBairro = TextEditingController();
  TextEditingController campoLocalidade = TextEditingController();
  TextEditingController campoUF = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                bloc.input.add(value);
              },
              inputFormatters: [maskFormatter],
              decoration: InputDecoration(
                  hintText: "Digite o Cep", border: OutlineInputBorder()),
            ),

            StreamBuilder<CepModel>(
                stream: bloc.output,
                initialData: CepModel(
                  logradouro: campoLogradouro.text,
                  bairro: "",
                  localidade: "",
                  uf: "",
                ),
                builder: (context, snapshot) {
                  CepModel model = snapshot.data;
                  campoLogradouro.text = "${model.logradouro}";
                  campoBairro.text = "${model.bairro}";
                  campoLocalidade.text = "${model.localidade}";
                  campoUF.text = "${model.uf}";

                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        TextFieldADD(
                          hint: "Rua",
                          controllerText: campoLogradouro,
                        ),
                        TextFieldADD(
                          hint: "Bairro",
                          controllerText: campoBairro,
                        ),
                        TextFieldADD(
                          hint: "Localidade",
                          controllerText: campoLocalidade,
                        ),
                        TextFieldADD(
                          hint: "UF",
                          controllerText: campoUF,
                        ),
                      ],
                    );
                  }
                }),
            //)
          ],
        ),
      ),
    );
  }
}
