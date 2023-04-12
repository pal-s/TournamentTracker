-- This query creates the MatchupEntries table

USE [Tournamnets]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MatchupEntries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MatchupId] [int] NOT NULL,
	[ParentMatchupId] [int] NULL,
	[TeamCompetingId] [int] NULL,
	[Score] [float] NULL,
CONSTRAINT [PK_MatchupEntries] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
)ON [PRIMARY]

GO

ALTER TABLE [dbo].[MatchupEntries] ADD CONSTRAINT [FK_MatchupId] FOREIGN KEY (MatchupId) REFERENCES [dbo].[Matchups](id)
GO

ALTER TABLE [dbo].[MatchupEntries] ADD CONSTRAINT [FK_ParentMatchId] FOREIGN KEY  (ParentMatchupId) REFERENCES [dbo].[Matchups](id)
GO

ALTER TABLE [dbo].[MatchupEntries] ADD CONSTRAINT [FK_TeamCompetingId] FOREIGN KEY  (TeamCompetingId) REFERENCES [dbo].[Teams](id)
GO