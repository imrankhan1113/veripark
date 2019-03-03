using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DBAccess
{
    public static class SchemaInfo
    {
        public static DataTable CreateBookDetailsSchemaTable()
        {
            DataTable dt = new DataTable();
            dt.TableName = "BookDetails";

            dt.Columns.Add("BookID"     , typeof(Int32));
            dt.Columns.Add("Title"      , typeof(String));
            dt.Columns.Add("ISBN"       , typeof(String));
            dt.Columns.Add("PublishYear", typeof(String));
            dt.Columns.Add("CoverPrice", typeof(Decimal));
            dt.Columns.Add("CheckOutStatusDescription", typeof(String));
            dt.Columns.Add("Image", typeof(String));
            dt.Columns.Add("CurrentBorrowerID", typeof(Int32));

            return dt;
        }

       
    }
}
