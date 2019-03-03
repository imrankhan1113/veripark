using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Data;

namespace BookCheckInAndOut
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int selectedBookID = 0;
            if (!String.IsNullOrWhiteSpace(Request.QueryString["bookID"]))
                selectedBookID = int.Parse(Request.QueryString["bookID"]);
            else { }
            // to do error message

            displayBookDeails(selectedBookID);
        }

     
        private void displayBookDeails(int BookID)
        {
            BusinessLogicDBOperations dbOperations = new BusinessLogicDBOperations();
            Book book = dbOperations.RetrieveBookDetails(BookID);

            if (book != null)
            {
                lblTitle.Text = book.Title;
                lblISBN.Text = book.ISBN;
               lblpublishDate.Text = book.PublishYear;
                lblcoverprice.Text = book.CoverPrice.ToString();
                lblcheckoutstatus.Text = book.CheckOutStatusDescription;

               // double penaltyAmount = calcultePenaltyAmount(DateTime.Now, borrower.ReturnDate);
               // lblPenaltyAmount.Text = String.Format("{0:#,##0.00}", penaltyAmount);

            }
            else
            {
                Utilities.Utilities.setPageMessage("Book is either already checked in or was not found.", Utilities.Utilities.severity.error, Page.Master);
                return;

            }

        }
        private double calcultePenaltyAmount(DateTime ActualReturnDate, DateTime ReqReturnedDate)
        {
            return 10;
        }

    }
}