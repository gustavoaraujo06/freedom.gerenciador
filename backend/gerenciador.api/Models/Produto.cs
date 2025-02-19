namespace gerenciador.api.Models
{
    public class Produto
    {
        public required int PedidoNumero { get; set; }            // xPed
        public required long CodigoEAN { get; set; }              // cEAN
        public required string CodigoProduto { get; set; }        // cProd
        public required double QuantidadeComercial { get; set; } // qCom
        public required long CodigoEANTributo { get; set; }        // cEANTrib
        public required double ValorProduto { get; set; }          // vProd
        public required string Descricao { get; set; }             // xProd
        public required string UnidadeTributo { get; set; }        // uTrib
        public required double ValorDesconto { get; set; }        // vDesc
        public required long NCM { get; set; }                     // NCM
        public required string UnidadeComercial { get; set; }      // uCom
        public required int CFOP { get; set; }                     // CFOP
        public required string Cest { get; set; }     
        public required Imposto Imposto { get; set; }

    }
    public class Imposto
    {
        public required ICMS ICMS { get; set; }
        public required IPI IPI { get; set; }
        public required COFINS COFINS { get; set; }
        public required PIS PIS { get; set; }
    }

    public class ICMS
    {
        public required double PST { get; set; }           // pST
        public required double Origem { get; set; }           // orig
        public required double CST { get; set; }              // CST
        public required double ValorBaseSubstituicao { get; set; } // vBCSTRet
        public required double ValorICMSSubstituto { get; set; }   // vICMSSubstituto
        public required double ValorICMSSubstitutoRetido { get; set; }  // vICMSSTRet
    }


    public class IPI
    {
        public required int CodigoEnquadramento { get; set; }  // cEnq
        public required int CST { get; set; }            // CST
        public required double QuantidadeUnidade { get; set; } // qUnid
        public required double ValorIPI { get; set; }    // vIPI
        public required double ValorUnidade { get; set; } // vUnid

    }

    public class COFINS
    {
        public required double ValorCOFINS { get; set; } // vCOFINS
        public required string CST { get; set; }         // CST
        public required double ValorBase { get; set; }     // vBC
        public required double PercentualCOFINS { get; set; } // pCOFINS
    }



    public class PIS
    {
        public required double ValorPIS { get; set; }   // vPIS
        public required string CST { get; set; }        // CST
        public required double ValorBase { get; set; }   // vBC
        public required double PercentualPIS { get; set; } // pPIS
    }
}
