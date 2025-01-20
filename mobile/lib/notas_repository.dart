import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/models/notafiscal.dart';
import 'package:http/http.dart' as http;

class NotasRepository extends ChangeNotifier {
  static Future<String> getToken() async {
    final response = await http.post(
        Uri.parse('https://gateway.apiserpro.serpro.gov.br/token'),
        headers: {
          'Authorization':
              'Basic THV3Vlh1RFdSZFhGZEYySW1CYkM3NndZZVJrYTpfTmZhVkU0TUtCdkJ3NXJ4bFRpcnlfZmpOUFlh',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: "grant_type=client_credentials");
    final token = jsonDecode(response.body)['access_token'];
    return token;
  }

  static Future<http.Response> getNFE(final String chaveAcesso) async {
    String token = await getToken();
    return http.get(
        Uri.parse(
            'https://gateway.apiserpro.serpro.gov.br/consulta-nfe-df/api/v1/nfe/$chaveAcesso'),
        headers: {'Authorization': 'Bearer $token'});
  }

  final List<NotaFiscal> _notas = [];
  UnmodifiableListView<NotaFiscal> get notas => UnmodifiableListView(_notas);

  void addNota(NotaFiscal nota) {
    _notas.add(nota);
    notifyListeners();
  }

  void removeNota(NotaFiscal nota) {
    _notas.remove(nota);
    notifyListeners();
  }
}
