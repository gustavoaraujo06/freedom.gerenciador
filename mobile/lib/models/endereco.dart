class Endereco{
  final String logradouro;
  final String numero;
  final String municipio;
  final String estado;
  final String pais;
  Endereco({required this.municipio, required this.estado, required this.pais, required this.logradouro, required this.numero});
  factory Endereco.fromJson(Map<String, dynamic> json){
    return Endereco(
      municipio: json['xMun'],
      estado: json['UF'],
      pais: json['xPais'],
      logradouro: json['xLgr'],
      numero: json['nro'] is String ? json['nro'] : json['nro'].toString(),
    );
  }
  @override
  String toString() {
    return "$logradouro, $numero - $municipio/$estado";
  }
}