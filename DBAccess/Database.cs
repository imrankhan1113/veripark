using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Configuration;

namespace DBAccess
{
    /// <summary>
    /// DAAB implementation 
    /// </summary>
    public class Database
    {
        private Microsoft.Practices.EnterpriseLibrary.Data.Database _db;
        private static string connectionStringName;
        protected void initialize()
        {
            connectionStringName = ConfigurationManager.ConnectionStrings["BookCheckINOUTDBConnection"].ToString();
        
        _db = new SqlDatabase(connectionStringName);

          //  _db = DatabaseFactory.CreateDatabase();
        }

        protected void initialize(string connectionStringName)
        {
            
            _db = DatabaseFactory.CreateDatabase(connectionStringName);
        }

        protected IDataReader ExecuteReader(SqlCommand command)
        {
            try
            {
                return _db.ExecuteReader(command);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        protected int ExecuteNonQuery(SqlCommand command)
        {

            return _db.ExecuteNonQuery(command);
        }
        
        
    }
}
