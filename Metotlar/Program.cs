using System;

namespace Metodlar
{
    class Program
    {
        static void Main(string[] args)
        {
            string UrunAdi = "Elma";
            double Fiyati = 15;
            string aciklama = "Amasya elması";

            string[] meyveler = new string[] { };

            Urun urun1 = new Urun();
            urun1.Adi = "Elma";
            urun1.Fiyati = 15;
            urun1.Aciklama = "Amasya Elması";

            Urun[] urunler = new[] { urun1 }; //array
            //type-safe--tip-güvenli
            foreach (Urun urunxx in urunler)
            {
                Console.WriteLine(urunxx.Adi);
                Console.WriteLine(urunxx.Fiyati);
                Console.WriteLine(urunxx.Aciklama);
                Console.WriteLine("------------------");


            }

            Console.WriteLine("-------------Metotlar------------");

            SepetMenegar sepetMenegar = new SepetMenegar();
            SepetMenegar.Ekle(urun1);
        }
    }
}
