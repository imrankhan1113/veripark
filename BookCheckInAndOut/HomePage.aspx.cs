using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Data;
using System.Windows.Media.Imaging;
using System.Threading;

namespace BookCheckInAndOut
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            displayBooks();

            
        }
        protected void btnDetail_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrWhiteSpace(hdnField.Value))
            {
                Utilities.Utilities.setPageMessage("Please select the book first.", Utilities.Utilities.severity.error, Page.Master);
                return;
            }
            Response.Redirect("Details.aspx?bookID=" + int.Parse(hdnField.Value));

        }

                protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            try
            {
                if (String.IsNullOrWhiteSpace(hdnField.Value))
                {
                    Utilities.Utilities.setPageMessage("Please select the book first.", Utilities.Utilities.severity.error, Page.Master);
                    return;
                }

                Response.Redirect("CheckOut.aspx?bookID=" + int.Parse(hdnField.Value));
            }
            catch(ThreadAbortException ex)
            {
               
            }
        }

        protected void btnCheckIn_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrWhiteSpace(hdnField.Value))
            {
                Utilities.Utilities.setPageMessage("Please select the book first.", Utilities.Utilities.severity.error, Page.Master);
                return;
            }

            Response.Redirect("CheckIn.aspx?bookID=" + int.Parse(hdnField.Value));
        }


        private void displayBooks()
        {
            BusinessLogicDBOperations dbOp = new BusinessLogicDBOperations();

            try
            {
                List<Book> books = dbOp.RetrieveBooksList();

                BooksList.DataSource = books;
                BooksList.DataBind();
            }
            catch(Exception ex)
            {
                Utilities.Utilities.setPageMessage(ex.Message, Utilities.Utilities.severity.error, Page.Master);
                return;
            }
           

        }

    }
}