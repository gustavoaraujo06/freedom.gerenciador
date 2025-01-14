class Produto {
  String codigo;
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
      this.codigo = "SC"}) {
    total = quantidade * valor;
  }
  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
        codigo: json['prod']['cProd'] is String
            ? json['prod']['cProd']
            : json['prod']['cProd'].toString(),
        descricao: json['prod']['xProd'],
        unidadeComercial: json['prod']['uCom'],
        valor: json['prod']['vUnCom'] is int
            ? json['prod']['vUnCom'].toDouble()
            : json['prod']['vUnCom'],
        quantidade: (json['prod']['qCom'] as int).toDouble());
  }
}