import 'dart:convert';

import 'package:mobile/models/endereco.dart';
import 'package:mobile/models/notafiscal.dart';
import 'package:mobile/models/pessoa_fisica.dart';
import 'package:mobile/models/pessoa_juridica.dart';
import 'package:mobile/models/produto.dart';
import 'package:http/http.dart' as http;

class NotasRepository {
  static Future<String> getToken() async {
    final response = await http.post(
        Uri.parse('https://gateway.apiserpro.serpro.gov.br/token'),
        headers: {
          'Authorization':
              'Basic THV3Vlh1RFdSZFhGZEYySW1CYkM3NndZZVJrYTpfTmZhVkU0TUtCdkJ3NXJ4bFRpcnlfZmpOUFlh',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: "grant_type=client_credentials");
    final token = jsonDecode(response.toString())['access_token'];
    return token;
  }

  static Future<http.Response> getNFE(final String chaveAcesso) async {
    String token = await getToken();
    print(token);
    return http.get(
        Uri.parse(
            'https://gateway.apiserpro.serpro.gov.br/consulta-nfe-df/api/v1/nfe/$chaveAcesso'),
        headers: {'Authorization': 'Bearer $token'});
  }

  static final List<NotaFiscal> _notas = [];
  static void addNota(NotaFiscal nota) {
    _notas.add(nota);
  }

  static getNotas() {
    return _notas;
  }
}
