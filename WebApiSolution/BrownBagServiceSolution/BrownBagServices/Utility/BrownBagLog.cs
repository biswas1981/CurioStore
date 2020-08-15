using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrownBagServices.Utility
{
    /// <summary>
    /// 
    /// </summary>
    public static class BrownBagLog
    {
        /// <summary>
        /// 
        /// </summary>
        public static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
    }
}