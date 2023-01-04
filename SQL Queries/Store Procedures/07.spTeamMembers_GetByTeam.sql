-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.spTeamMembers_GetByTeam 
	@TeamId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select p.*
	from dbo.TeamMembers m 
	inner join dbo.People p on m.PersonId = p.id
	where m.TeamId = @TeamId;
END
GO
