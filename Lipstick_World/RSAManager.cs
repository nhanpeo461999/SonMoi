using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Lipstick_World
{
    public class RSAManager
    {
        public  RSACryptoServiceProvider rsaCrypto = null;

        public RSACryptoServiceProvider _rsaPrivate = null;
        private  RSACryptoServiceProvider _rsaPublic = null;

        public  void KeysToContainer(string containername)
        {
            CspParameters cp = new CspParameters(1);
            cp.Flags = CspProviderFlags.UseMachineKeyStore;

            cp.KeyContainerName = containername;
            RSACryptoServiceProvider privatestore = new RSACryptoServiceProvider(cp);
            privatestore.FromXmlString(rsaCrypto.ToXmlString(true));
            privatestore.PersistKeyInCsp = true;
            privatestore.Clear();
        }

        public  void ContainerToKeys(string containername)
        {
            CspParameters cspParams = new CspParameters(1);
            cspParams.Flags = CspProviderFlags.UseMachineKeyStore;
            cspParams.ProviderName = "Microsoft Strong Cryptographic Provider";

            cspParams.KeyContainerName = containername;
            rsaCrypto = new RSACryptoServiceProvider(cspParams);

            _rsaPrivate = new RSACryptoServiceProvider();
            _rsaPrivate.FromXmlString(rsaCrypto.ToXmlString(true));

            _rsaPublic = new RSACryptoServiceProvider();
            _rsaPublic.FromXmlString(rsaCrypto.ToXmlString(false));
        }

        public  void XmlToKeys(string xmlfilename)
        {
            CspParameters cspParams = new CspParameters(1);
            rsaCrypto = new RSACryptoServiceProvider(cspParams);

            StreamReader keyReader = new StreamReader(xmlfilename);
            string keyXml = keyReader.ReadToEnd();
            keyReader.Dispose();

            rsaCrypto = new RSACryptoServiceProvider();
            rsaCrypto.FromXmlString(keyXml);

            _rsaPrivate = new RSACryptoServiceProvider();
            _rsaPrivate.FromXmlString(keyXml);

            _rsaPublic = new RSACryptoServiceProvider();
            _rsaPublic.FromXmlString(rsaCrypto.ToXmlString(false));
        }

        public  void GenerateNewKeys(int bits)
        {
            CspParameters cspParams = new CspParameters(1);
            rsaCrypto = new RSACryptoServiceProvider(bits, cspParams);

            _rsaPrivate = new RSACryptoServiceProvider();
            _rsaPrivate.FromXmlString(rsaCrypto.ToXmlString(true));

            _rsaPublic = new RSACryptoServiceProvider();
            _rsaPublic.FromXmlString(rsaCrypto.ToXmlString(false));
        }

        public  string EncryptWithPublic(string cleartext)
        {
            byte[] plainbytes = Encoding.Unicode.GetBytes(cleartext);
            byte[] cipherbytes = _rsaPublic.Encrypt(plainbytes, false);
            return Convert.ToBase64String(cipherbytes);
        }

        public  string EncryptWithPrivate(string cleartext)
        {
            byte[] plainbytes = Encoding.Unicode.GetBytes(cleartext);
            byte[] cipherbytes = _rsaPrivate.Encrypt(plainbytes, false);
            return Convert.ToBase64String(cipherbytes);
        }

        /// <summary>
        /// Attempts to decrypt ciphertext with public key.
        /// As this is RSA (asymmetric algo) this method should always fail.
        /// </summary>
        /// <param name="ciphertext">The ciphertext.</param>
        /// <returns></returns>
        public  string DecryptWithPublic(string ciphertext)
        {
            string cleartext = "";

            try
            {
                byte[] cipherbytes = Convert.FromBase64String(ciphertext);
                byte[] plain = _rsaPublic.Decrypt(cipherbytes, false);
                cleartext = System.Text.Encoding.Unicode.GetString(plain);
            }
            catch
            {
                throw;
            }

            return cleartext;
        }

        public  string DecryptWithPrivate(string ciphertext)
        {
            string cleartext = "";

            try
            {
                byte[] cipherbytes = Convert.FromBase64String(ciphertext);
                byte[] plain = _rsaPrivate.Decrypt(cipherbytes, false);
                cleartext = System.Text.Encoding.Unicode.GetString(plain);
            }
            catch
            {
                throw;
            }

            return cleartext;
        }

    }
}
