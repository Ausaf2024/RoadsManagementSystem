using System;
using System.Security.Cryptography;
using System.Text;

namespace SecurityUtility.Cryptography
{
    public static class Hasher
    {
        public static string GenerateSHA1(string inputStr)
        {
            StringBuilder _hashBuilder = new StringBuilder();
            UTF8Encoding _encoder = new UTF8Encoding();

            try
            {
                using (SHA1 _SHA1hasher = SHA1.Create())
                {
                    byte[] _encodedBytes = _encoder.GetBytes(inputStr);
                    _encodedBytes = _SHA1hasher.ComputeHash(_encodedBytes);

                    for (int i = 0; i < _encodedBytes.Length; i++)
                    {
                        _hashBuilder.Append(_encodedBytes[i].ToString("x2"));
                    }
                }
            }
            catch (Exception ex)
            {
                string _strErr = "Error in HashCode : " + ex.Message;
            }
            return _hashBuilder.ToString();
        }

        public static bool VerifySHA1Hash(string input, string hash)
        {
            string _hashOfInput = GenerateSHA1(input);
            StringComparer _comparer = StringComparer.OrdinalIgnoreCase;

            if (_comparer.Compare(_hashOfInput, hash) == 0) return true;
            else return false;
        }

        public static string GenerateSHA512(string inputStr)
        {
            StringBuilder _hashBuilder = new StringBuilder();

            try
            {
                using (SHA512Managed HashTool = new SHA512Managed())
                {
                    Byte[] PasswordAsByte = System.Text.Encoding.UTF8.GetBytes(inputStr);
                    byte[] hash = HashTool.ComputeHash(PasswordAsByte);
                    HashTool.Clear();
                    for (int i = 0; i < hash.Length; i++) _hashBuilder.Append(hash[i].ToString("X2"));
                }
            }
            catch (Exception ex)
            {
                string _strErr = "Error in HashCode : " + ex.Message;
            }
            return _hashBuilder.ToString().ToLower();
        }

        public static bool VerifySHA512Hash(string input, string hash)
        {
            string _hashOfInput = GenerateSHA512(input);
           
            StringComparer _comparer = StringComparer.OrdinalIgnoreCase;

            if (_comparer.Compare(_hashOfInput, hash) == 0) return true;
            else return false;
        }

        public static string GenerateMD5(string inputStr)
        {
            StringBuilder _hashBuilder = new StringBuilder();
            UTF8Encoding _encoder = new UTF8Encoding();

            try
            {
                using (MD5 _MD5hasher = MD5.Create())
                {
                    byte[] _encodedBytes = _encoder.GetBytes(inputStr);
                    _encodedBytes = _MD5hasher.ComputeHash(_encodedBytes);

                    for (int i = 0; i < _encodedBytes.Length; i++)
                    {
                        _hashBuilder.Append(_encodedBytes[i].ToString("x2"));
                    }
                }
            }
            catch (Exception ex)
            {
                string _strErr = "Error in HashCode : " + ex.Message;
            }
            return _hashBuilder.ToString();
        }

        // Generate Hash in UpperCase, Need to be Checked
        //public static string GenerateMD5(string inputStr)
        //{
        //    string _hashString = string.Empty;
        //    UTF8Encoding _encoder = new UTF8Encoding();

        //    try
        //    {
        //        using (MD5CryptoServiceProvider _MD5hasher = new MD5CryptoServiceProvider())
        //        {
        //            byte[] _encodedBytes = _encoder.GetBytes(inputStr);
        //            _encodedBytes = _MD5hasher.ComputeHash(_encodedBytes);
        //            _hashString = BitConverter.ToString(_encodedBytes);
        //            _hashString = _hashString.Replace("-", "");
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        string _strErr = "Error in HashCode : " + ex.Message;
        //    }
        //    return _hashString;
        //}

        public static bool VerifyMd5Hash(string input, string hash)
        {
            string _hashOfInput = GenerateMD5(input);
            StringComparer _comparer = StringComparer.OrdinalIgnoreCase;

            if (_comparer.Compare(_hashOfInput, hash) == 0) return true;
            else return false;
        }
        public static string GenerateSHA256(string inputStr)
        {
            StringBuilder _hashBuilder = new StringBuilder();
            try
            {
                using (SHA256Managed HashTool = new SHA256Managed())
                {
                    Byte[] PasswordAsByte = System.Text.Encoding.UTF8.GetBytes(inputStr);
                    byte[] hash = HashTool.ComputeHash(PasswordAsByte);
                    HashTool.Clear();
                    for (int i = 0; i < hash.Length; i++) _hashBuilder.Append(hash[i].ToString("X2"));
                }
            }
            catch (Exception ex)
            {
                string _strErr = "Error in HashCode : " + ex.Message;
            }
            return _hashBuilder.ToString().ToLower();
        }
    }
}
