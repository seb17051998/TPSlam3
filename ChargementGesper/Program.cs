using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using libGesper;
using MySql.Data.MySqlClient;

namespace ChargementGesper
{
    class Program
    {
        static void Main(string[] args)
        {
           Donnees lesDonnees = new Donnees();
           try
           {
               lesDonnees.ConnexionBDD();
               Console.WriteLine("Connexion à la base de donnée réussi");
           }
           catch
           {
               Console.WriteLine("Erreur à la connexion de la base de données");
           }
           lesDonnees.ChargerDiplomes(lesDonnees.ConnexionBDD());
           lesDonnees.ChargerEmployes(lesDonnees.ConnexionBDD());
           

           
           

           Console.ReadLine();
        }
    }
}
