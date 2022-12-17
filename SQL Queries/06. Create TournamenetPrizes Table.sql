-- Creates the TournamentsPrizes table

USE [Tournamnets]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TournamentPrizes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NOT NULL,
	[PrizeId] [int] NOT Null,

CONSTRAINT [PK_TournamentPrizes] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
)ON [PRIMARY]

GO

ALTER TABLE [dbo].[TournamentPrizes] ADD CONSTRAINT [FK_TournamentPrizesId] FOREIGN KEY  (TournamentId) REFERENCES [dbo].[Tournaments](id)
GO

ALTER TABLE [dbo].[TournamentPrizes] ADD CONSTRAINT [FK_PrizesId] FOREIGN KEY  (PrizeId) REFERENCES [dbo].[Prizes](id)
GO

ALTER TABLE [dbo].[TournamentPrizes] ADD CONSTRAINT [UC_TournementsPrizes] UNIQUE (TournamentId,PrizeId)
GO