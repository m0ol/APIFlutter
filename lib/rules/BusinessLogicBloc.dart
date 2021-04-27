import 'dart:async';

import 'package:dio/dio.dart';

import '../models/CepModel.dart';

class BusinessLogicBloc {
  final StreamController<String> _streamController =
      StreamController<String>.broadcast();

  Sink<String> get input => _streamController.sink;
  Stream<CepModel> get output => _streamController.stream
      .where((cep) => cep.length > 8)
      .asyncMap((cep) => _searchCep(cep));

  String url(String cep) => "https://viacep.com.br/ws/$cep/json";

  Future<CepModel> _searchCep(String cep) async {
    Response response = await Dio().get(url(cep));
    return CepModel.fromJson(response.data);
  }
}
