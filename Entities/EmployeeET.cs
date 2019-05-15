using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    //POCO or DTO Classes 
    public class EmployeeET
    {
        public int EmployeeID { get; set; }
        public string EmployeeLastName { get; set; }
        public string EmployeeFirstName { get; set; }
        public string EmployeePhone { get; set; }
        public string EmployeeZip { get; set; }
        public DateTime HireDate { get; set; }

        public EmployeeET()
        {
            EmployeeID = 0;
            EmployeeLastName = "";
            EmployeeFirstName = "";
            EmployeeZip = "";
            HireDate = new DateTime(1960, 1, 1);
        }
    }
}
