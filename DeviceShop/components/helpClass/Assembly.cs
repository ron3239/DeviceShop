using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DeviceShop.components.helpClass
{
    public class Assembly
    {
        public int AssemblyId { get; set; }

        [Required]
        public int ProductId { get; set; }
        public virtual Details Product { get; set; }

        [Required]
        [Range(1, int.MaxValue)]
        public int Quantity { get; set; }

        public DateTime Date { get; set; } = DateTime.Now;
        public bool IsPosted { get; set; } = false;

        public virtual ICollection<AssemblyComponent> Components { get; set; } = new List<AssemblyComponent>();
    }

    public class AssemblyComponent
    {
        public int Id { get; set; }
        public int AssemblyId { get; set; }
        public virtual Assembly Assembly { get; set; }

        public int ComponentId { get; set; }
        public virtual Component Component { get; set; }

        [Required]
        [Range(1, int.MaxValue)]
        public int QuantityPerItem { get; set; }
    }
}
