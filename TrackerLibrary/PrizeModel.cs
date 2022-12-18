using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TrackerLibrary
{
    /// <summary>
    /// Represent the prize in the tournament.
    /// </summary>
    public class PrizeModel
    {
        /// <summary>
        /// This unique identifier for the prize.
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// This numeric identifier for the place (1 for first place, etc.)
        /// </summary>
        public int PlaceNumber { get; set; }

        /// <summary>
        /// The friendy name for the place (second place, first runner up, etc.
        /// </summary>
        public string PlaceName { get; set; }

        /// <summary>
        /// The fixed amount this place earns or zero if it is not used.
        /// </summary>
        public decimal PrizeAmount { get; set; }

        /// <summary>
        /// This number that represents the percentage of the overall take or
        /// zero if it is not used. The percentage is fraction of 1 (so 0.5 for 50%).
        /// </summary>
        public double PrizePercentage { get; set; }
    }
}
