import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapibloc/BusinessLogicBloc.dart';
import 'package:flutterapibloc/models/CepModel.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var maskFormatter = new MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});
  BusinessLogicBloc bloc = BusinessLogicBloc();
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
              //keyboardType: TextInputType.number,
            ),
            Center(
              child: StreamBuilder<CepModel>(
                  stream: bloc.output,
                  initialData: CepModel(
                    logradouro: "",
                    bairro: "",
                    localidade: "",
                    uf: "",
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                        "Erro na Pesquisa",
                        style: TextStyle(color: Colors.red),
                      );
                    }
                    CepModel model = snapshot.data;
                    return Text("Logradouro: ${model.logradouro}\n" +
                        "Bairro:${model.bairro}\n" +
                        "Localidade: ${model.localidade}\n" +
                        "UF: ${model.uf}\n");
                  }),
            )
          ],
        ),
      ),
    );
  }
}
