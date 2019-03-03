using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookCheckInAndOut.Utilities
{
    public static class Utilities
    {
        /// <summary>
        /// This function calculates the date after specified number of work/business days
        /// Friday and Saturday are treated as off days.
        /// </summary>
        /// <param name="days">Business days</param>
        /// <returns>Target Date</returns>
        public static DateTime getDateAfterSpecifiedBusinessDays(int days)
        {
            DateTime TargetDate = DateTime.Now.AddDays(15);

            return TargetDate;
        }

        public static void setPageMessage(string message, severity level, System.Web.UI.MasterPage master)
        {
            Label messageLabel = (Label) master.FindControl("lblMessage");
            messageLabel.Text = message;

            if (level == severity.error)
                messageLabel.ForeColor = System.Drawing.Color.Red;
            else
                messageLabel.ForeColor = System.Drawing.Color.Green;
        }


        public  enum severity
            {
                info,
                error
            
            }
    }


}