namespace gerenciador.api.Models
{
    public class Produto
    {
        public int PedidoNumero { get; set; }            // xPed
        public long CodigoEAN { get; set; }              // cEAN
        public string CodigoProduto { get; set; }        // cProd
        public double QuantidadeComercial { get; set; } // qCom
        public long CodigoEANTributo { get; set; }        // cEANTrib
        public double ValorProduto { get; set; }          // vProd
        public string Descricao { get; set; }             // xProd
        public string UnidadeTributo { get; set; }        // uTrib
        public double ValorDesconto { get; set; }        // vDesc
        public long NCM { get; set; }                     // NCM
        public string UnidadeComercial { get; set; }      // uCom
        public int CFOP { get; set; }                     // CFOP
        public string Cest { get; set; }                  // CEST
        public Imposto Imposto { get; set; }

    }
    public class Imposto
    {
        public ICMS ICMS { get; set; }
        public IPI IPI { get; set; }
        public COFINS COFINS { get; set; }
        public PIS PIS { get; set; }
    }

    public class ICMS
    {
        public double PST { get; set; }           // pST
        public double Origem { get; set; }           // orig
        public double CST { get; set; }              // CST
        public double ValorBaseSubstituicao { get; set; } // vBCSTRet
        public double ValorICMSSubstituto { get; set; }   // vICMSSubstituto
        public double ValorICMSSubstitutoRetido { get; set; }  // vICMSSTRet
    }


    public class IPI
    {
        public int CodigoEnquadramento { get; set; }  // cEnq
        public int CST { get; set; }            // CST
        public double QuantidadeUnidade { get; set; } // qUnid
        public double ValorIPI { get; set; }    // vIPI
        public double ValorUnidade { get; set; } // vUnid

    }

    public class COFINS
    {
        public double ValorCOFINS { get; set; } // vCOFINS
        public string CST { get; set; }         // CST
        public double ValorBase { get; set; }     // vBC
        public double PercentualCOFINS { get; set; } // pCOFINS
    }



    public class PIS
    {
        public double ValorPIS { get; set; }   // vPIS
        public string CST { get; set; }        // CST
        public double ValorBase { get; set; }   // vBC
        public double PercentualPIS { get; set; } // pPIS
    }
}
