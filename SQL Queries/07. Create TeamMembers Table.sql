-- Creates the TeamMembers table

USE [Tournamnets]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TeamMembers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TeamId] [int] NOT NULL,
	[PersonId] [int] NOT Null,

CONSTRAINT [PK_TeamMembers] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
)ON [PRIMARY]

GO

ALTER TABLE [dbo].[TeamMembers] ADD CONSTRAINT [FK_TeamMembersTeams] FOREIGN KEY  (TeamId) REFERENCES [dbo].[Teams](id)
GO

ALTER TABLE [dbo].[TeamMembers] ADD CONSTRAINT [FK_TeamMembersPeople] FOREIGN KEY  (PersonId) REFERENCES [dbo].[People](id)
GO

ALTER TABLE [dbo].[TeamMembers] ADD CONSTRAINT [UC_TeamIdPersonID] UNIQUE (TeamId,PersonId)
GO