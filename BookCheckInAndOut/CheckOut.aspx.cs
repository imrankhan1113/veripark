using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookCheckInAndOut.Utilities;
using BusinessLogic;
using System.Data;


namespace BookCheckInAndOut
{
    public partial class CheckOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int selectedBookID = 0;
            if (!String.IsNullOrWhiteSpace(Request.QueryString["bookID"]))
                selectedBookID = int.Parse(Request.QueryString["bookID"]);
            else { }
                // to do error message

            lblCheckOutDate.Text = DateTime.Now.ToString();
            lblReturnDate.Text = Utilities.Utilities.getDateAfterSpecifiedBusinessDays(15).ToString();

            displayBookCheckOutHistory(selectedBookID);
           
        }

        /// <summary>
        /// This function is responsible for populating the book history grid.
        /// </summary>
        /// <param name="bookID">Book ID</param>
        private void displayBookCheckOutHistory(int bookID)
        {
            BusinessLogicDBOperations dbOperations = new BusinessLogicDBOperations();
            List<Borrower> borrowers = dbOperations.RetrieveBookCheckOutHistory(bookID);

            HistoryList.DataSource = borrowers;
            HistoryList.DataBind();

           
        }

        /// <summary>
        /// Check Out button event handler
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            int selectedBookID = 0;
            if (!String.IsNullOrWhiteSpace(Request.QueryString["bookID"]))
                selectedBookID = int.Parse(Request.QueryString["bookID"]);
            else
            {
                Utilities.Utilities.setPageMessage("Please select a book.", Utilities.Utilities.severity.error, Page.Master);
                return;
            }

            BusinessLogicDBOperations dbOperations = new BusinessLogicDBOperations();

            string bookName = txtName.Text;
            string mobileNo = txtMobile.Text;
            string nationalID = txtNationalID.Text;
            DateTime checkOutDate = DateTime.Parse(lblCheckOutDate.Text);
            DateTime returnDate = DateTime.Parse(lblReturnDate.Text);

           int result = dbOperations.CheckOut(selectedBookID,
                bookName,
                mobileNo,
                nationalID,
                checkOutDate,
                returnDate
                );

           if (result == 0)
           {
               Utilities.Utilities.setPageMessage("Encountered an error while checking out.", Utilities.Utilities.severity.error, Page.Master);
               return;
           }

           Utilities.Utilities.setPageMessage("Book has been checked out in the name of " + txtName.Text, Utilities.Utilities.severity.info, Page.Master);

           displayBookCheckOutHistory(selectedBookID);
        }

    }
}