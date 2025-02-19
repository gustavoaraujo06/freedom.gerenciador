namespace gerenciador.api.Models
{
    public class Cobranca
    {
        public double ValorOriginal { get; set; }
        public long NumeroFatura { get; set; }
        public double ValorDesconto { get; set; }
        public double ValorLiquido { get; set; }
    }
}
