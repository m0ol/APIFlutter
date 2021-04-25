import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../BusinessLogicBloc.dart';

class TextFieldADD extends StatefulWidget {
  final MaskTextInputFormatter maskFormatter;
  final BusinessLogicBloc bloc;
  final String hint;
  final TextInputType keyboard;

  TextFieldADD({this.maskFormatter, this.bloc, this.hint, this.keyboard});

  @override
  _TextFieldADDState createState() => _TextFieldADDState();
}

class _TextFieldADDState extends State<TextFieldADD> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        widget.bloc.input.add(value);
      },
      inputFormatters: [widget.maskFormatter],
      decoration:
          InputDecoration(hintText: widget.hint, border: OutlineInputBorder()),
      keyboardType: widget.keyboard,
    );
  }
}
