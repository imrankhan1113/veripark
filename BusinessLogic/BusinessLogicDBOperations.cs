using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DBAccess;

namespace BusinessLogic
{
    public class BusinessLogicDBOperations
    {

        public List<Book> RetrieveBooksList()
        {
            List<Book> books = null;

            BookCheckInCheckOutDBOperations db = BookCheckInCheckOutDBOperations.getInstance();

            IDataReader reader = db.RetrieveBooksList();

            DataTable dt = SchemaInfo.CreateBookDetailsSchemaTable();


            if (reader != null)
            {
                books = new List<Book>();

                while (reader.Read())
                {


                    books.Add(new Book
                    {
                        BookID = (int)reader["BookID"],
                        Title = (string)reader["Title"],
                        ISBN = (string)reader["ISBN"],
                        PublishYear = (string)reader["PublishYear"],
                        CoverPrice = (decimal)reader["CoverPrice"],
                        CheckOutStatusDescription = (string)reader["CheckOutStatusDescription"]
                    });
                }
            }



            return books;
        }

        public List<Borrower> RetrieveBookCheckOutHistory(int BookID)
        {
            List<Borrower> borrowers = null;
            BookCheckInCheckOutDBOperations db = BookCheckInCheckOutDBOperations.getInstance();

            IDataReader reader = db.RetrieveBookCheckOutHistory(BookID);

            if (reader != null)
            {
                borrowers = new List<Borrower>();

                while (reader.Read())
                {
                    borrowers.Add(new Borrower
                    {
                        Name = (string)reader["Name"],
                        CheckOutDate = (DateTime)reader["CheckOutDate"],
                        ReturnDate = (DateTime)reader["ReturnDate"]
                    });
                }
            }

            return borrowers;
        }

        public Book RetrieveBookDetails(int BookID)
        {
            Book Book1 = null;

            BookCheckInCheckOutDBOperations db = BookCheckInCheckOutDBOperations.getInstance();

            IDataReader reader = db.RetrieveBookDetails(BookID);
            if (reader != null)
                if (reader.Read())
                {
                    Book1 = new Book();


                    Book1.BookID = (int)reader["BookID"];
                    Book1.Title = (string)reader["Title"];
                    Book1.ISBN = (string)reader["ISBN"];
                    Book1.PublishYear = (string)reader["PublishYear"];
                    Book1.CoverPrice = (decimal)reader["CoverPrice"];
                } 


            return Book1;
        }
        public Borrower RetrieveBookBorrowerDetails(int BookID)
        {
            Borrower borrower = null;

            BookCheckInCheckOutDBOperations db = BookCheckInCheckOutDBOperations.getInstance();

            IDataReader reader = db.RetrieveBookBorrowerDetails(BookID);

            if (reader != null)
                if (reader.Read())
                {
                    borrower = new Borrower();
                    borrower.Name = (string)reader["Name"];
                    borrower.MobileNo = (string)reader["Mobile"];
                    borrower.ReturnDate = (DateTime)reader["ReturnDate"];
                }

            return borrower;
        }

        public int CheckIn(int bookID)
        {
            BookCheckInCheckOutDBOperations db = BookCheckInCheckOutDBOperations.getInstance();

            return db.CheckIn(bookID);
        }

        public int CheckOut(int bookID, string Name, string MobileNo, string NationalID, DateTime checkOutDate, DateTime ReturnDate)
        {
            BookCheckInCheckOutDBOperations db = BookCheckInCheckOutDBOperations.getInstance();

            return db.CheckOut(bookID, Name, MobileNo, NationalID, checkOutDate, ReturnDate);
        }
    }
}
