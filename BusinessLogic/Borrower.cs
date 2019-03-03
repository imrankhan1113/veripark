using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class Borrower
    {
        public string MobileNo { get; set; }
        public string NationalID { get; set; }

        public string Name { get; set; }

        public DateTime ReturnDate { get; set; }
        public DateTime CheckOutDate { get; set; }

        public Book Book { get; set; }

    }
}
