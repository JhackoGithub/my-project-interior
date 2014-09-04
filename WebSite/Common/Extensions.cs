namespace WebSite.Common
{
    public static class Extensions
    {
        public static string ConvertProjectType(this int type)
        {
            switch (type)
            {
                case 0:
                    return Constant.PROJECT_ARCHITECTURE;
                case 1:
                    return Constant.PROJECT_INTERIOR;
            }
            return Constant.PROJECT_ARCHITECTURE;
        }
    }
}