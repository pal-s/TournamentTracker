using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using TrackerLibrary.DataAccess;

namespace TrackerLibrary
{
    public static class GlobalConfig
    {
        public static IDataConnection Connection { get; private set; }


        public static void InitializeConnections(DatabaseType db)
        {

            if (db == DatabaseType.Sql)
            {
                //TODO - Set up the SQL Connector properly.
                SqlConnector sql = new SqlConnector();
                Connection = sql;
            }
            else if (db == DatabaseType.TextFile)
            {
                //TODO - Set up the Text Connection.
                TextConnector text = new TextConnector();
                Connection = text;
            }
        }

        public static string CnnString(string name) 
        {
            return ConfigurationManager.ConnectionStrings[name].ConnectionString;
        }
    }
}
