//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DeviceShop
{
    using System;
    using System.Collections.Generic;
    
    public partial class SpecificationComponents
    {
        public int ComponentId { get; set; }
        public int SpecificationId { get; set; }
        public Nullable<int> AccessoriesId { get; set; }
        public Nullable<int> DetailsId { get; set; }
        public int Quantity { get; set; }
    
        public virtual Accessories Accessories { get; set; }
        public virtual Details Details { get; set; }
        public virtual Specifications Specifications { get; set; }
    }
}
