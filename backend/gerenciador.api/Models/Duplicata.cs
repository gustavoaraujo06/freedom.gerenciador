namespace gerenciador.api.Models
{
    public class Duplicata
    {
        public DateTime DataVencimento { get; set; }
        public double Valor { get; set; }
        public required string Numero { get; set; }
    }
}
