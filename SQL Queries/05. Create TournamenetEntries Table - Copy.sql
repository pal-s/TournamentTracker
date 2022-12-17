-- Creates the TournamentsEntries table

USE [Tournamnets]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TournamentEntries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NOT NULL,
	[TeamId] [int] NOT Null,

CONSTRAINT [PK_TournamentEntries] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
)ON [PRIMARY]

GO

ALTER TABLE [dbo].[TournamentEntries] ADD CONSTRAINT [FK_TournamentsId] FOREIGN KEY  (TournamentId) REFERENCES [dbo].[Tournaments](id)
GO

ALTER TABLE [dbo].[TournamentEntries] ADD CONSTRAINT [FK_TeamsId] FOREIGN KEY  (TeamId) REFERENCES [dbo].[Teams](id)
GO

ALTER TABLE [dbo].[TournamentEntries] ADD CONSTRAINT [UC_TournementsEntries] UNIQUE (TournamentId,TeamId)
GO