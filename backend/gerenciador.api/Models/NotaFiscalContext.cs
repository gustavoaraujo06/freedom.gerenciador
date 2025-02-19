using Microsoft.EntityFrameworkCore;

namespace gerenciador.api.Models
{
    public class NotaFiscalContext : DbContext
    {
        public NotaFiscalContext(DbContextOptions<NotaFiscalContext> options) : base(options)
        {
        }
        public DbSet<NotaFiscal> Notas { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<NotaFiscal>().OwnsMany(nota => nota.Produtos, produto =>
            {
                produto.OwnsOne(produto => produto.Imposto, imposto =>
                {
                    imposto.OwnsOne(i => i.ICMS);
                    imposto.OwnsOne(i => i.IPI);
                    imposto.OwnsOne(i => i.COFINS);
                    imposto.OwnsOne(i => i.PIS);
                });
            });
            base.OnModelCreating(modelBuilder);
        }
    }
}
