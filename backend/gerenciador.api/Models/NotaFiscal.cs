namespace gerenciador.api.Models
{
    public class NotaFiscal
    {
        public int Id { get; set; }
        public int TipoNota { get; set; }
        public double ValorCofins { get; set; }          // vCOFINS
        public double ValorBaseCalculoICMS { get; set; }             // vBCST
        public double ValorIcmsDesonerado { get; set; }    // vICMSDeson
        public double ValorProdutos { get; set; }        // vProd
        public double ValorSeguro { get; set; }          // vSeg
        public double ValorFCP { get; set; }             // vFCP
        public double ValorFCPST { get; set; }           // vFCPST
        public double ValorNotaFiscal { get; set; }      // vNF
        public double ValorPis { get; set; }             // vPIS
        public double ValorIpiDevolvido { get; set; }      // vIPIDevol
        public double ValorBaseCalculo { get; set; }          // vBC
        public double ValorST { get; set; }              // Somatório do valor do ICMS com Substituição Tributária de todos os produtos da NF-e
        public double ValorICMS { get; set; }            // vICMS
        public double ValorImpostoImportacao { get; set; }              // Somatório do valor do Imposto de Importação de todos os produtos da NF-e
        public double ValorFCPSTRet { get; set; }        // vFCPSTRet
        public double ValorDescontoTotal { get; set; }   // vDesc
        public double ValorOutro { get; set; }           // vOutro
        public double ValorIPI { get; set; }             // vIPI
        public double ValorFrete { get; set; }
        public int IndicadorPresenca { get; set; }
        public DateTime DataEmissao { get; set; }
        public DateTime DataSaidaMercadoria { get; set; }
        public required string NaturezaOperacao { get; set; }

        public required Cobranca Cobranca{ get; set; }
        public required Pagamento Pagamento { get; set; }

        public required ICollection<Produto> Produtos { get; set; }
    }
}
