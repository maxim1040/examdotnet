using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using exam.Models;
using Microsoft.Data.SqlClient;
using System.Xml.Linq;
using System.Windows;

namespace exam
{
    internal class MyDbContext:DbContext
    {

            public DbSet<User> Users { get; set; }
            public DbSet<QuestionsGK> QuestionsGKs { get; set; }
            public DbSet<UsersQuestions> UsersQuestionss { get; set; }
            public DbSet<Capitals> Capitalss { get; set; }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
                optionsBuilder.UseSqlServer("Server=localhost\\SQLEXPRESS;Database=quizzt;Integrated Security=True;Encrypt=True;TrustServerCertificate=True");
               
        }


    }
      
}

