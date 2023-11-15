using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace exam.Models
{
    internal class QuestionsGK
    {
        public int Id { get; set; }
        public required string Question { get; set; }
        public required string PossibleAnswer1 { get; set; }
        public required string PossibleAnswer2 { get; set; }
        public required string PossibleAnswer3 { get; set; }
        public required string PossibleAnswer4 { get; set; }
        public required string CorrectAnswer { get; set; }

    }
}
