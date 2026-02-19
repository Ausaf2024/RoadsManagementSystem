using System.Web;
using System;
using SecurityUtility.Cryptography;

namespace SecurityUtility.Salt
{

    public static class RandomSaltGenerator
    {
        static string _rndVal;
        public static string Generate(HttpContext context, bool isPostBack)
       {
            Random _random = new Random();

        Again: _rndVal = Hasher.GenerateSHA512((_random.Next() * 32767).ToString() + "good!@#$1234");

            if (_rndVal.Length == 0) goto Again;

            if (!isPostBack)
            {
                context.Session["__PreviousSaltHash"] = _rndVal;
                context.Session["__SaltHash"] = _rndVal;
            }
            else
            {
                context.Session["__PreviousSaltHash"] = context.Session["__SaltHash"];
                context.Session["__SaltHash"] = _rndVal;
            }
            return _rndVal;
        }

        public static string GetSessionSalt(HttpContext context)
        {
            try
            {
                return Convert.ToString(context.Session["__PreviousSaltHash"]);
            }
            catch (Exception)
            {
                return string.Empty;
            }

        }

    }
}
