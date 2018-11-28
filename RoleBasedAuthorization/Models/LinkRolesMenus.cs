using System;
using System.Collections.Generic;

namespace RoleBasedAuthorization.Models
{
    public partial class LinkRolesMenus
    {
        public int Id { get; set; }
        public int RolesId { get; set; }
        public int MenusId { get; set; }

        public Menus Menus { get; set; }
        public Roles Roles { get; set; }
    }
}
