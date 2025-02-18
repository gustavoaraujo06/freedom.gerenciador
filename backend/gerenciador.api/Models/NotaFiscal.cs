namespace gerenciador.api.Models
{
    public class NotaFiscal
    {
        public int Id { get; set; }
        public string Numero { get; set; }
        public string Serie { get; set; }
        public string ChaveAcesso { get; set; }
        public string DataEmissao { get; set; }
        public string DataEntradaSaida { get; set; }
        public string ValorTotal { get; set; }
        public string ValorProdutos { get; set; }
        public string ValorFrete { get; set; }
        public string ValorSeguro { get; set; }
        public string ValorDesconto { get; set; }
        public string ValorOutrasDespesas { get; set; }
        public string ValorIpi { get; set; }
        public string ValorPis { get; set; }
        public string ValorCofins { get; set; }
        public string ValorIcms { get; set; }
        public string ValorIcmsSt { get; set; }
        public string ValorIss { get; set; }
        public string ValorRetidoPis { get; set; }
        public string ValorRetidoCofins { get; set; }
        public string ValorRetidoCsll { get; set; }
        public string ValorRetidoIrrf { get; set; }
        public string ValorRetidoInss { get; set; }
        public string ValorRetidoFunrural { get; set; }
        public string ValorRetidoIcms { get; set; }
        public string ValorRetidoIss { get; set; }
        public string ValorRetido { get; set; }
        public string ValorLiquido { get; set; }
        public string ValorAproxTributos { get; set; }
        public string Observacoes { get; set; }
        public string CnpjEmitente { get; set; }
        public string RazaoSocialEmitente { get; set; }
        public string CnpjDestinatario { get; set; }
        public string RazaoSocialDestinatario { get; set; }
        public string CnpjTransportadora { get; set; }
        public string RazaoSocialTransportadora { get; set; }
        public string CnpjTerceiro { get; set; }
        public string RazaoSocialTerceiro { get; set; }
    }
}
