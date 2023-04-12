-- This query creates the Matchups table

USE [Tournamnets]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Matchups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NOT NULL,
	[WinnerId] [int] NULL,
	[MatchupRound] [int] NOT NULL,
CONSTRAINT [PK_Matchups] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
)ON [PRIMARY]

GO

ALTER TABLE [dbo].[Matchups] ADD CONSTRAINT [FK_MatchupsTournamentsId] FOREIGN KEY  (TournamentId) REFERENCES [dbo].[Tournaments](id)
GO

ALTER TABLE [dbo].[Matchups] ADD CONSTRAINT [FK_WinnerId] FOREIGN KEY  (WinnerId) REFERENCES [dbo].[Teams](id)
GO
