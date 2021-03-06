USE [master]
GO
/****** Object:  Database [DBColetaDados]    Script Date: 15/09/2017 00:43:44 ******/
CREATE DATABASE [DBColetaDados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBColetaDados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\DBColetaDados.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBColetaDados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\DBColetaDados_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBColetaDados] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBColetaDados].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBColetaDados] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBColetaDados] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBColetaDados] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBColetaDados] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBColetaDados] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBColetaDados] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBColetaDados] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBColetaDados] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBColetaDados] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBColetaDados] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBColetaDados] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBColetaDados] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBColetaDados] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBColetaDados] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBColetaDados] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBColetaDados] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBColetaDados] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBColetaDados] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBColetaDados] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBColetaDados] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBColetaDados] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBColetaDados] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBColetaDados] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBColetaDados] SET  MULTI_USER 
GO
ALTER DATABASE [DBColetaDados] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBColetaDados] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBColetaDados] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBColetaDados] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBColetaDados] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBColetaDados] SET QUERY_STORE = OFF
GO
USE [DBColetaDados]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DBColetaDados]
GO
/****** Object:  Table [dbo].[TBAlunos]    Script Date: 15/09/2017 00:43:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBAlunos](
	[RA] [varchar](13) NOT NULL,
	[Nome] [varchar](120) NOT NULL,
	[Email] [varchar](120) NOT NULL,
	[Carimbo] [date] NOT NULL,
	[Nascimento] [varchar](40) NOT NULL,
	[Deficiencia] [varchar](3) NOT NULL,
	[EstadoCivil] [varchar](11) NOT NULL,
	[Filhos] [varchar](50) NOT NULL,
	[Cidade] [varchar](6) NOT NULL,
	[Locomocao] [varchar](10) NOT NULL,
	[SituacaoDomiciliar] [varchar](10) NOT NULL,
	[TempoMoradia] [varchar](50) NOT NULL,
	[MoraCom] [varchar](10) NOT NULL,
	[Trabalha] [varchar](50) NOT NULL,
	[MediaRenda] [varchar](50) NOT NULL,
	[PeriodoEstudo] [varchar](9) NOT NULL,
	[PessoasResidem] [varchar](50) NOT NULL,
	[PessoasTrabalham] [varchar](50) NOT NULL,
	[SomaRendas] [varchar](50) NOT NULL,
	[PeriodoTrabalho] [varchar](20) NOT NULL,
	[VidaEscolar] [varchar](50) NOT NULL,
	[ConhecimentoInformatica] [varchar](15) NOT NULL,
	[MotivoVestibular] [varchar](50) NOT NULL,
	[ConhecimentoLingua] [varchar](3) NOT NULL,
	[Linguas] [varchar](20) NOT NULL,
	[Meio] [varchar](3) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ExcluirAluno]    Script Date: 15/09/2017 00:43:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExcluirAluno]
	@RA varchar(13)
AS
BEGIN
	DELETE  
		FROM TBAlunos
		WHERE RA = @RA
END
GO
/****** Object:  StoredProcedure [dbo].[ExcluiTodos]    Script Date: 15/09/2017 00:43:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExcluiTodos]
AS
BEGIN
	DELETE FROM TBAlunos
END
GO
/****** Object:  StoredProcedure [dbo].[InsereAlunos]    Script Date: 15/09/2017 00:43:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsereAlunos]
	@RA varchar(13),
	@Nome varchar(120),
	@Email varchar(120),
	@Carimbo date,
	@Nascimento varchar(40),
	@Deficiencia varchar(3),
	@EstadoCivil varchar(11),
	@Filhos varchar(50),
	@Cidade varchar(6),
	@Locomocao varchar(10),
	@SituacaoDomiciliar varchar(10),
	@TempoMoradia varchar(50),
	@MoraCom varchar(10),
	@Trabalha varchar(50),
	@MediaRenda varchar(50),
	@PeriodoEstudo varchar(9),
	@PessoasResidem varchar(50),
	@PessoasTrabalham varchar(50),
	@SomaRendas varchar(50),
	@PeriodoTrabalho varchar(20),
	@VidaEscolar varchar(50),
	@ConhecimentoInformatica varchar(15),
	@MotivoVestibular varchar(50),
	@ConhecimentoLingua varchar(3),
	@Linguas varchar(20),
	@Meio varchar(3)
AS
BEGIN
	INSERT 
		INTO TBAlunos(RA,Nome,Email,Carimbo,Nascimento,Deficiencia,EstadoCivil,Filhos,Cidade,Locomocao,SituacaoDomiciliar,TempoMoradia,MoraCom,Trabalha,MediaRenda,PeriodoEstudo,PessoasResidem,PessoasTrabalham,SomaRendas,PeriodoTrabalho,VidaEscolar,ConhecimentoInformatica,MotivoVestibular,ConhecimentoLingua,Linguas,Meio)
			VALUES(@RA,@Nome,@Email,@Carimbo,@Nascimento,@Deficiencia,@EstadoCivil,@Filhos,@Cidade,@Locomocao,@SituacaoDomiciliar,@TempoMoradia,@MoraCom,@Trabalha,@MediaRenda,@PeriodoEstudo,@PessoasResidem,@PessoasTrabalham,@SomaRendas,@PeriodoTrabalho,@VidaEscolar,@ConhecimentoInformatica,@MotivoVestibular,@ConhecimentoLingua,@Linguas,@Meio)
END
GO
/****** Object:  StoredProcedure [dbo].[ListaAlunos]    Script Date: 15/09/2017 00:43:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListaAlunos]
AS
BEGIN
	SELECT *	
		FROM TBAlunos
END
GO
/****** Object:  StoredProcedure [dbo].[VerificaAluno]    Script Date: 15/09/2017 00:43:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificaAluno]
	@RA varchar(13),
	@Nome varchar(120)
AS
BEGIN
	SELECT 
		TOP 1 1
		FROM TBAlunos 
		WHERE RA = @RA AND Nome = @Nome
END
GO
USE [master]
GO
ALTER DATABASE [DBColetaDados] SET  READ_WRITE 
GO
