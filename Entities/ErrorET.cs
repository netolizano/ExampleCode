using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class ErrorET
    {
        public string Code { get; set; }
        public string Error { get; set; }

        public ErrorET(string code, string error)
        {
            Code = code;
            Error = error;
        }
    }
}
