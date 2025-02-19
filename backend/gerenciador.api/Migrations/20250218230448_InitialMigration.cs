using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace gerenciador.api.Migrations
{
    /// <inheritdoc />
    public partial class InitialMigration : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Notas",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    Numero = table.Column<string>(type: "text", nullable: false),
                    Serie = table.Column<string>(type: "text", nullable: false),
                    ChaveAcesso = table.Column<string>(type: "text", nullable: false),
                    DataEmissao = table.Column<string>(type: "text", nullable: false),
                    DataEntradaSaida = table.Column<string>(type: "text", nullable: false),
                    ValorTotal = table.Column<string>(type: "text", nullable: false),
                    ValorProdutos = table.Column<string>(type: "text", nullable: false),
                    ValorFrete = table.Column<string>(type: "text", nullable: false),
                    ValorSeguro = table.Column<string>(type: "text", nullable: false),
                    ValorDesconto = table.Column<string>(type: "text", nullable: false),
                    ValorOutrasDespesas = table.Column<string>(type: "text", nullable: false),
                    ValorIpi = table.Column<string>(type: "text", nullable: false),
                    ValorPis = table.Column<string>(type: "text", nullable: false),
                    ValorCofins = table.Column<string>(type: "text", nullable: false),
                    ValorIcms = table.Column<string>(type: "text", nullable: false),
                    ValorIcmsSt = table.Column<string>(type: "text", nullable: false),
                    ValorIss = table.Column<string>(type: "text", nullable: false),
                    ValorRetidoPis = table.Column<string>(type: "text", nullable: false),
                    ValorRetidoCofins = table.Column<string>(type: "text", nullable: false),
                    ValorRetidoCsll = table.Column<string>(type: "text", nullable: false),
                    ValorRetidoIrrf = table.Column<string>(type: "text", nullable: false),
                    ValorRetidoInss = table.Column<string>(type: "text", nullable: false),
                    ValorRetidoFunrural = table.Column<string>(type: "text", nullable: false),
                    ValorRetidoIcms = table.Column<string>(type: "text", nullable: false),
                    ValorRetidoIss = table.Column<string>(type: "text", nullable: false),
                    ValorRetido = table.Column<string>(type: "text", nullable: false),
                    ValorLiquido = table.Column<string>(type: "text", nullable: false),
                    ValorAproxTributos = table.Column<string>(type: "text", nullable: false),
                    Observacoes = table.Column<string>(type: "text", nullable: false),
                    CnpjEmitente = table.Column<string>(type: "text", nullable: false),
                    RazaoSocialEmitente = table.Column<string>(type: "text", nullable: false),
                    CnpjDestinatario = table.Column<string>(type: "text", nullable: false),
                    RazaoSocialDestinatario = table.Column<string>(type: "text", nullable: false),
                    CnpjTransportadora = table.Column<string>(type: "text", nullable: false),
                    RazaoSocialTransportadora = table.Column<string>(type: "text", nullable: false),
                    CnpjTerceiro = table.Column<string>(type: "text", nullable: false),
                    RazaoSocialTerceiro = table.Column<string>(type: "text", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Notas", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Produto",
                columns: table => new
                {
                    NotaFiscalId = table.Column<int>(type: "integer", nullable: false),
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    PedidoNumero = table.Column<int>(type: "integer", nullable: false),
                    CodigoEAN = table.Column<long>(type: "bigint", nullable: false),
                    CodigoProduto = table.Column<string>(type: "text", nullable: false),
                    QuantidadeComercial = table.Column<double>(type: "double precision", nullable: false),
                    CodigoEANTributo = table.Column<long>(type: "bigint", nullable: false),
                    ValorProduto = table.Column<double>(type: "double precision", nullable: false),
                    Descricao = table.Column<string>(type: "text", nullable: false),
                    UnidadeTributo = table.Column<string>(type: "text", nullable: false),
                    ValorDesconto = table.Column<double>(type: "double precision", nullable: false),
                    NCM = table.Column<long>(type: "bigint", nullable: false),
                    UnidadeComercial = table.Column<string>(type: "text", nullable: false),
                    CFOP = table.Column<int>(type: "integer", nullable: false),
                    Cest = table.Column<string>(type: "text", nullable: false),
                    Imposto_ICMS_PST = table.Column<double>(type: "double precision", nullable: false),
                    Imposto_ICMS_Origem = table.Column<double>(type: "double precision", nullable: false),
                    Imposto_ICMS_CST = table.Column<double>(type: "double precision", nullable: false),
                    Imposto_ICMS_ValorBaseSubstituicao = table.Column<double>(type: "double precision", nullable: false),
                    Imposto_ICMS_ValorICMSSubstituto = table.Column<double>(type: "double precision", nullable: false),
                    Imposto_ICMS_ValorICMSSubstitutoRetido = table.Column<double>(type: "double precision", nullable: false),
                    Imposto_IPI_CodigoEnquadramento = table.Column<int>(type: "integer", nullable: false),
                    Imposto_IPI_CST = table.Column<int>(type: "integer", nullable: false),
                    Imposto_IPI_QuantidadeUnidade = table.Column<double>(type: "double precision", nullable: false),
                    Imposto_IPI_ValorIPI = table.Column<double>(type: "double precision", nullable: false),
                    Imposto_IPI_ValorUnidade = table.Column<double>(type: "double precision", nullable: false),
                    Imposto_COFINS_ValorCOFINS = table.Column<double>(type: "double precision", nullable: false),
                    Imposto_COFINS_CST = table.Column<string>(type: "text", nullable: false),
                    Imposto_COFINS_ValorBase = table.Column<double>(type: "double precision", nullable: false),
                    Imposto_COFINS_PercentualCOFINS = table.Column<double>(type: "double precision", nullable: false),
                    Imposto_PIS_ValorPIS = table.Column<double>(type: "double precision", nullable: false),
                    Imposto_PIS_CST = table.Column<string>(type: "text", nullable: false),
                    Imposto_PIS_ValorBase = table.Column<double>(type: "double precision", nullable: false),
                    Imposto_PIS_PercentualPIS = table.Column<double>(type: "double precision", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Produto", x => new { x.NotaFiscalId, x.Id });
                    table.ForeignKey(
                        name: "FK_Produto_Notas_NotaFiscalId",
                        column: x => x.NotaFiscalId,
                        principalTable: "Notas",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Produto");

            migrationBuilder.DropTable(
                name: "Notas");
        }
    }
}
