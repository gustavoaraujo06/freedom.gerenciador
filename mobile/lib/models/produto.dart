class Produto {
  int codigo;
  final String descricao;
  final String unidadeComercial;
  final double valor;
  final double quantidade;
  late final double total;
  Produto(
      {required this.descricao,
      required this.unidadeComercial,
      required this.valor,
      required this.quantidade,
      this.codigo = -1}) {
    total = quantidade * valor;
  }
  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
        codigo: int.parse(json['prod']['cProd']),
        descricao: json['prod']['xProd'],
        unidadeComercial: json['prod']['uCom'],
        valor: double.parse(json['prod']['vUnCom']),
        quantidade: double.parse(json['prod']['qCom']));
  }
}