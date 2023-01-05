-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.spTournamentPrizes_Insert
	@TournamentId int,
	@PrizeId int,
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;
	insert into dbo.TournamentPrizes(TournamentId,PrizeId)
	values(@TournamentId,@PrizeId);

	select @id = SCOPE_IDENTITY();
END
GO
