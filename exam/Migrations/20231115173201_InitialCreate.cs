using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace exam.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Capitalss",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Question = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PossibleAnswer1 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PossibleAnswer2 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PossibleAnswer3 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PossibleAnswer4 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CorrectAnswer = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Capitalss", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "QuestionsGKs",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Question = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PossibleAnswer1 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PossibleAnswer2 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PossibleAnswer3 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PossibleAnswer4 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CorrectAnswer = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_QuestionsGKs", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Username = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Password = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Points = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "UsersQuestionss",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Question = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PossibleAnswer1 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PossibleAnswer2 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PossibleAnswer3 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PossibleAnswer4 = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CorrectAnswer = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UsersQuestionss", x => x.Id);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Capitalss");

            migrationBuilder.DropTable(
                name: "QuestionsGKs");

            migrationBuilder.DropTable(
                name: "Users");

            migrationBuilder.DropTable(
                name: "UsersQuestionss");
        }
    }
}
