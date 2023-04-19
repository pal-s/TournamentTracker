using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TrackerLibrary.Models;

namespace TrackerLibrary
{
    public static class TournamentLogic
    {
        // Order list randomly
        // Check if itis big enough - if not, add byes - 2*2*2*2  - 2^4
        // Create our round of Matchup
        // Create every round after that - 8 mathups - 4 matchups - 2 matchups - 1 matchup


        public static void CreateRounds(TournamentModel model)
        {
            List<TeamModel> ramdomizedTeams = RamdomaizeTeamOrder(model.EnteredTeams);
            int rounds = FindNumberOfRounds(ramdomizedTeams.Count);
            int byes = NumberOfByes(rounds, ramdomizedTeams.Count);

            model.Rounds.Add(CreateFirstRound(byes, ramdomizedTeams));
            CreateOtherRounds(model, rounds);
        }

        private static void CreateOtherRounds(TournamentModel model, int rounds)
        {
            int round = 2;
            List<MatchupModel> previousRound = model.Rounds[0];

            List<MatchupModel> currRound = new List<MatchupModel>();
            MatchupModel currMatchup = new MatchupModel();

            while (round <= rounds)
            {
                foreach (MatchupModel match in previousRound)
                {
                    currMatchup.Entries.Add(new MatchupEntryModel { ParentMatchup= match });

                    if (currMatchup.Entries.Count > 1)
                    {
                        currMatchup.MatchupRound = round;
                        currRound.Add(currMatchup);
                        currMatchup= new MatchupModel(); 
                    }
                }

                model.Rounds.Add(currRound);
                previousRound = currRound;
                currRound= new List<MatchupModel>();
                round ++;
            }
        }

        private static List<MatchupModel> CreateFirstRound (int byes, List<TeamModel> teams)
        {
            List<MatchupModel> output = new List<MatchupModel>();
            MatchupModel currentModel = new MatchupModel();

            foreach (TeamModel team in teams)
            {
                currentModel.Entries.Add(new MatchupEntryModel { TeamCompeting =team });

                if (byes > 0 || currentModel.Entries.Count > 1)
                {
                    currentModel.MatchupRound = 1;
                    output.Add(currentModel);
                    currentModel= new MatchupModel();

                    if (byes > 0)
                    {
                        byes -= 1;
                    }
                }
            }

            return output;
        }

        private static int NumberOfByes(int rounds, int numberOfTeams)
        {
            int output = 0;
            int totalTeams = 1;

            for (int i = 1; i <= rounds; i++)
            {
                totalTeams *= 2;
            }
            output = totalTeams - numberOfTeams;
            return output;
        }

        private static int FindNumberOfRounds(int teamCount)
        {
            int output = 1;
            int val = 2;

            while (val < teamCount )
            {
                output += 1;

                val *= 2;
            }

            return output;
        }

        private static List<TeamModel> RamdomaizeTeamOrder(List<TeamModel> teams)
        {
            return teams.OrderBy(x => Guid.NewGuid()).ToList();
        }
    }
}
