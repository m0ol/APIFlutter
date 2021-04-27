import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldADD extends StatefulWidget {
  final String hint;
  final TextEditingController controllerText;

  TextFieldADD({this.hint, this.controllerText});

  @override
  _TextFieldADDState createState() => _TextFieldADDState();
}

class _TextFieldADDState extends State<TextFieldADD> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controllerText,
      decoration:
          InputDecoration(hintText: widget.hint, border: OutlineInputBorder()),
    );
  }
}
