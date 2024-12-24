import 'package:mobile/models/endereco.dart';

abstract class Pessoa{
  final String nome;
  final Endereco endereco;
  Pessoa({required this.nome, required this.endereco});
}