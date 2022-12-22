using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TrackerLibrary.Models
{
    /// <summary>
    /// Represent the one team.
    /// </summary>
    public class TeamModel
    {
        /// <summary>
        /// Person who is part of the team.
        /// </summary>
        public List<PersonModel> TeamMembers { get; set; } = new List<PersonModel>();

        /// <summary>
        /// The name of the team.
        /// </summary>
        public string TeamName { get; set; }
    }
}
