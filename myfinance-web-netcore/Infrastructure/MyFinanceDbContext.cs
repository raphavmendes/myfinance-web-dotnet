using Microsoft.EntityFrameworkCore;
using myfinance_web_netcore.Domain;

namespace myfinance_web_netcore.Infrastructure
{
    public class MyFinanceDbContext : DbContext
    {
        public DbSet<PlanoConta> PlanoConta { get; set; }

        public DbSet<Transacao> Transacao { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder OptionsBuilder)
        {
            //var connectionString = @"Server=LOCALHOST\SQLEXPRESS;Database=myfinance;Trusted_Connection=True;TrustServerCertificate-True";
            //OptionsBuilder.UseSqlServer(connectionString);

            var connectionString = @"Data Source=LOCALHOST\SQLEXPRESS;Initial Catalog=myfinance;Trusted_Connection=True;TrustServerCertificate=True";
            OptionsBuilder.UseSqlServer(connectionString);
        }
    }
}