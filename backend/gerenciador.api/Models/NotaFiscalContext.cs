using Microsoft.EntityFrameworkCore;

namespace gerenciador.api.Models
{
    public class NotaFiscalContext : DbContext
    {
        public DbSet<NotaFiscal> NotaFiscals { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<NotaFiscal>().OwnsMany(p => p.Produtos, d =>
            {
                d.OwnsOne(c => c.Imposto);
            });
        }
    }
}
