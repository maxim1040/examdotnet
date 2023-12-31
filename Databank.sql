USE [master]
GO
/****** Object:  Database [quizzt]    Script Date: 15-11-23 20:49:37 ******/
CREATE DATABASE [quizzt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quizzt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\quizzt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'quizzt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\quizzt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [quizzt] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quizzt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quizzt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quizzt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quizzt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quizzt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quizzt] SET ARITHABORT OFF 
GO
ALTER DATABASE [quizzt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [quizzt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quizzt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quizzt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quizzt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quizzt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quizzt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quizzt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quizzt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quizzt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [quizzt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quizzt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quizzt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quizzt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quizzt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quizzt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quizzt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quizzt] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [quizzt] SET  MULTI_USER 
GO
ALTER DATABASE [quizzt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quizzt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quizzt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quizzt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [quizzt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [quizzt] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [quizzt] SET QUERY_STORE = ON
GO
ALTER DATABASE [quizzt] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [quizzt]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 15-11-23 20:49:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Capitalss]    Script Date: 15-11-23 20:49:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Capitalss](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[PossibleAnswer1] [nvarchar](max) NOT NULL,
	[PossibleAnswer2] [nvarchar](max) NOT NULL,
	[PossibleAnswer3] [nvarchar](max) NOT NULL,
	[PossibleAnswer4] [nvarchar](max) NOT NULL,
	[CorrectAnswer] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Capitalss] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionsGKs]    Script Date: 15-11-23 20:49:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionsGKs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[PossibleAnswer1] [nvarchar](max) NOT NULL,
	[PossibleAnswer2] [nvarchar](max) NOT NULL,
	[PossibleAnswer3] [nvarchar](max) NOT NULL,
	[PossibleAnswer4] [nvarchar](max) NOT NULL,
	[CorrectAnswer] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_QuestionsGKs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15-11-23 20:49:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Points] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersQuestionss]    Script Date: 15-11-23 20:49:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersQuestionss](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[PossibleAnswer1] [nvarchar](max) NOT NULL,
	[PossibleAnswer2] [nvarchar](max) NOT NULL,
	[PossibleAnswer3] [nvarchar](max) NOT NULL,
	[PossibleAnswer4] [nvarchar](max) NOT NULL,
	[CorrectAnswer] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UsersQuestionss] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231115173201_InitialCreate', N'7.0.13')
GO
SET IDENTITY_INSERT [dbo].[Capitalss] ON 

INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (1, N'What is the capital of France?', N'Berlin', N'Madrid', N'Paris', N'Rome', N'Paris')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (2, N'Which city is the capital of Japan?', N'Beijing', N'Seoul', N'Bangkok', N'Tokyo', N'Tokyo')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (3, N'Canberra is the capital of which country?', N'Australia', N'Canada', N'New Zealand', N'South Africa', N'Australia')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (4, N'What is the capital city of Brazil?', N'Brasília', N'São Paulo', N'Rio de Janeiro', N'Buenos Aires', N'Brasília')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (5, N'The capital of Italy is?', N'Berlin', N'Madrid', N'Rome', N'Athens', N'Rome')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (6, N'Which city is the capital of India?', N'Delhi', N'Mumbai', N'Kolkata', N'Chennai', N'Delhi')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (7, N'What is the capital of Canada?', N'Toronto', N'Ottawa', N'Vancouver', N'Montreal', N'Ottawa')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (8, N'Which city is the capital of South Korea?', N'Beijing', N'Seoul', N'Tokyo', N'Bangkok', N'Seoul')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (9, N'What is the capital of South Africa?', N'Pretoria', N'Cape Town', N'Johannesburg', N'Nairobi', N'Pretoria')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (10, N'The capital of Russia is?', N'Berlin', N'Moscow', N'Warsaw', N'Bucharest', N'Moscow')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (11, N'Which city is the capital of Germany?', N'Berlin', N'Madrid', N'Paris', N'Rome', N'Berlin')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (12, N'What is the capital of Mexico?', N'Madrid', N'Buenos Aires', N'Mexico City', N'Lima', N'Mexico City')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (13, N'The capital of China is?', N'Beijing', N'Seoul', N'Tokyo', N'Bangkok', N'Beijing')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (14, N'Which city is the capital of Egypt?', N'Cairo', N'Alexandria', N'Riyadh', N'Istanbul', N'Cairo')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (15, N'What is the capital of Argentina?', N'São Paulo', N'Buenos Aires', N'Lima', N'Montevideo', N'Buenos Aires')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (16, N'The capital of Nigeria is?', N'Lagos', N'Abuja', N'Nairobi', N'Accra', N'Abuja')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (17, N'Which city is the capital of Turkey?', N'Istanbul', N'Ankara', N'Athens', N'Riyadh', N'Ankara')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (18, N'What is the capital of Saudi Arabia?', N'Dubai', N'Abu Dhabi', N'Riyadh', N'Doha', N'Riyadh')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (19, N'The capital of Spain is?', N'Barcelona', N'Lisbon', N'Madrid', N'Seville', N'Madrid')
INSERT [dbo].[Capitalss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (20, N'Which city is the capital of Australia?', N'Sydney', N'Melbourne', N'Canberra', N'Auckland', N'Canberra')
SET IDENTITY_INSERT [dbo].[Capitalss] OFF
GO
SET IDENTITY_INSERT [dbo].[QuestionsGKs] ON 

INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (1, N'What is the capital of Japan?', N'Beijing', N'Tokyo', N'Seoul', N'Bangkok', N'Tokyo')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (2, N'Who is the author of "To Kill a Mockingbird"?', N'J.K. Rowling', N'Harper Lee', N'George Orwell', N'Ernest Hemingway', N'Harper Lee')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (3, N'In what year did the Titanic sink?', N'1905', N'1912', N'1920', N'1931', N'1912')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (4, N'What is the largest ocean on Earth?', N'Atlantic Ocean', N'Indian Ocean', N'Arctic Ocean', N'Pacific Ocean', N'Pacific Ocean')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (5, N'Who developed the theory of relativity?', N'Isaac Newton', N'Galileo Galilei', N'Albert Einstein', N'Stephen Hawking', N'Albert Einstein')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (6, N'Which planet is known as the "Red Planet"?', N'Venus', N'Mars', N'Jupiter', N'Saturn', N'Mars')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (7, N'Who painted the Sistine Chapel ceiling?', N'Vincent van Gogh', N'Leonardo da Vinci', N'Michelangelo', N'Pablo Picasso', N'Michelangelo')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (8, N'What is the currency of Brazil?', N'Peso', N'Euro', N'Real', N'Dollar', N'Real')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (9, N'Which famous scientist developed the three laws of motion?', N'Isaac Newton', N'Galileo Galilei', N'Nikola Tesla', N'Albert Einstein', N'Isaac Newton')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (10, N'In which year did the Apollo 11 mission land on the moon?', N'1965', N'1969', N'1973', N'1981', N'1969')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (11, N'Who wrote "1984"?', N'George Orwell', N'Aldous Huxley', N'Ray Bradbury', N'J.K. Rowling', N'George Orwell')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (12, N'What is the largest mammal on land?', N'Elephant', N'Giraffe', N'Hippopotamus', N'Rhinoceros', N'Elephant')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (13, N'Which element has the chemical symbol "O"?', N'Osmium', N'Oxygen', N'Oganesson', N'Osmium', N'Oxygen')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (14, N'What is the capital of Canada?', N'Toronto', N'Ottawa', N'Vancouver', N'Montreal', N'Ottawa')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (15, N'Who is known as the "Father of Computer Science"?', N'Alan Turing', N'Charles Babbage', N'Ada Lovelace', N'Bill Gates', N'Alan Turing')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (16, N'What is the largest desert in the world?', N'Gobi Desert', N'Sahara Desert', N'Antarctica', N'Arabian Desert', N'Antarctica')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (17, N'Who wrote "Hamlet"?', N'Jane Austen', N'Charles Dickens', N'William Shakespeare', N'Emily Brontë', N'William Shakespeare')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (18, N'Which gas do plants absorb during photosynthesis?', N'Oxygen', N'Carbon Dioxide', N'Nitrogen', N'Hydrogen', N'Carbon Dioxide')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (19, N'What is the speed of light in a vacuum?', N'299,792 kilometers per second', N'150,000 kilometers per second', N'100,000 kilometers per second', N'200,000 kilometers per second', N'299,792 kilometers per second')
INSERT [dbo].[QuestionsGKs] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (20, N'Who was the first woman to win a Nobel Prize?', N'Marie Curie', N'Rosalind Franklin', N'Jane Goodall', N'Dorothy Crowfoot Hodgkin', N'Marie Curie')
SET IDENTITY_INSERT [dbo].[QuestionsGKs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [Username], [Password], [Points]) VALUES (1, N'a', N'a', N'a', N'a', 12)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Username], [Password], [Points]) VALUES (2, N'maxim', N'maxim', N'maxim', N'maxim', 0)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Username], [Password], [Points]) VALUES (3, N'f', N'f', N'f', N'f', 1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Username], [Password], [Points]) VALUES (4, N't', N't', N't', N't', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersQuestionss] ON 

INSERT [dbo].[UsersQuestionss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (1, N'a', N'a', N'z', N'e', N'r', N'z')
INSERT [dbo].[UsersQuestionss] ([Id], [Question], [PossibleAnswer1], [PossibleAnswer2], [PossibleAnswer3], [PossibleAnswer4], [CorrectAnswer]) VALUES (2, N'k', N'a', N'b', N'c', N'd', N'c')
SET IDENTITY_INSERT [dbo].[UsersQuestionss] OFF
GO
USE [master]
GO
ALTER DATABASE [quizzt] SET  READ_WRITE 
GO
