-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.spMatchupEntries_Insert
	@MatchupId int,
	@ParentMatchId int,
	@TeamCompetingId int,

	@id int = 0 output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT into dbo.MatchupEntries (MatchupId, ParentMatchupId, TeamCompetingId)
	values(@MatchupId, @ParentMatchId, @TeamCompetingId);

	select @id = SCOPE_IDENTITY();
END
GO
