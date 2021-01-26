using System;
using System.Collections.Generic;
using System.Text;

namespace OOP3
{
    class BasvuruManager
    {
        public void BasvuruYap(IKrediManager krediManager, ILoggerService loggerService)
        {
            //başvuran bilgilerini değerlendirme
            //
            //KonutKrediManager konutKrediManager = new KonutKrediManager();
            //konutKrediManager.Hesapla();
            //böyle bişey yapsak sadece konut kredisi için hesaplama yapacak
            krediManager.Hesapla();
            loggerService.Log();

        }
        /// birden fazla kredi manager secebilmek için;  List yapısını kullanıcaz..

        public void KrediOnBilgilendirmesiYap(List<IKrediManager> krediler)
        {
            foreach (var kredi in krediler)
            {
                kredi.Hesapla();

            }
        }
        
    }
}
