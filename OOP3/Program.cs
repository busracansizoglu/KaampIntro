using System;
using System.Collections.Generic;

namespace OOP3
{
    class Program
    {
        static void Main(string[] args)
        {
            //IhtiyacKrediManager ihtiyacKrediManager = new IhtiyacKrediManager();
            //ihtiyacKrediManager.Hesapla();

            //TasitKrediManager tasitKrediManager = new TasitKrediManager();
            //tasitKrediManager.Hesapla();

                          //// ya da böyle yazabiliriz...
            
            //IKrediManager konutKrediManager = new KonutKrediManager();
            //konutKrediManager.Hesapla();

            //IKrediManager esnafKrediManager = new EsnafKrediManager();
            //esnafKrediManager.Hesapla();

            
            IKrediManager konutKrediManager = new KonutKrediManager();
            IKrediManager esnafKrediManager = new EsnafKrediManager();
            IKrediManager ihtiyacKrediManager = new IhtiyacKrediManager();
            IKrediManager tasitKrediManager = new TasitKrediManager();



            ILoggerService databaseLoggerService = new DatabaseLoggerService();
            ILoggerService fileLogerService = new FileLoggerService();

            BasvuruManager basvuruManager = new BasvuruManager();
            basvuruManager.BasvuruYap(ihtiyacKrediManager, new DatabaseLoggerService());

            basvuruManager.BasvuruYap(new EsnafKrediManager(), new SmsLoggerService());

            // bu olay yazılımda sürdürülebilirliği sağlar..

            // daha fazla eklemek için ...

            List<IKrediManager> krediler = new List<IKrediManager>() {ihtiyacKrediManager,konutKrediManager,tasitKrediManager,esnafKrediManager };
            //basvuruManager.KrediOnBilgilendirmesiYap(krediler);

        }
    }
}
