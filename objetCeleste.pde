class objetCeleste {
  float mass;
  long semiMajorAxis;
  PVector coordonnee;
  float rapport;
  int highestPoint;
  int lowestPoint;
  float radius;
  float increment;
  color coloration;
  String repertoireEnregistrement;
  String nom;

  objetCeleste(String name) {
    nom = name;
    switch(name) {

      case("Soleil"):
      mass = 1.9891e30;
      semiMajorAxis = 0;
      coordonnee = new PVector(0, 0, 0);
      lowestPoint = 0;
      highestPoint = 0;
      increment = 1;
      coloration = color(255, 255, 0);
      repertoireEnregistrement = "graduationSphereSoleil/####.png";
      break;

      case("Mercure"):
      mass = 3.3011e23;
      semiMajorAxis = 57909230;
      coordonnee = new PVector(57909230, 0, 0);
      lowestPoint = 23500;
      highestPoint = 23604;
      radius = 2439;
      increment = 1;
      coloration = color(186, 186, 196);
      repertoireEnregistrement = "graduationSphereMercure/####.png";
      break;

      case("Venus"):
      mass = 4.8685e24;
      semiMajorAxis = 108209500;
      coordonnee = new PVector(108209500, 0, 0);
      lowestPoint = 169000;
      highestPoint = 169560;
      radius = 6051;
      increment = 1;
      coloration = color(228, 227, 225);
      repertoireEnregistrement = "graduationSphereVenus/####.png";
      break;

      case("Terre"):
      nom = "la Terre";
      mass = 5.9722e24;
      semiMajorAxis = 149597887;
      coordonnee = new PVector(149597887, 0, 0);
      lowestPoint = 258750; //258750
      highestPoint = 259800; //259800
      radius = 6371;
      increment = 10;
      coloration = color(6, 69, 173);
      repertoireEnregistrement = "graduationSphereTerre/####.png";
      break;

      case("Lune"):
      nom = "la Lune";
      mass = 7.3477e22;
      semiMajorAxis = 384399;//384399;
      coordonnee = new PVector(149597887, 200000, 0);
      lowestPoint = 0;
      highestPoint = 1000000;
      radius = 1737;
      increment = 10;
      coloration = color(6, 69, 173);
      repertoireEnregistrement = "graduationSphereLune/####.png";
      break;

      case("Mars"):
      mass = 4.8685e24;
      semiMajorAxis = 227944000;
      coordonnee = new PVector(227944000, 0, 0);
      lowestPoint = 356040;
      highestPoint = 357180;
      radius = 3389;
      increment = 1;
      coloration = color(235, 127, 91);
      repertoireEnregistrement = "graduationSphereMars/####.png";
      break;

      case("Jupiter"):
      mass = 1.8986e27;
      semiMajorAxis = 778340000;
      coordonnee = new PVector(778340000, 0, 0);
      lowestPoint = 23326000;
      highestPoint = 24820000;
      radius = 69911;
      increment = 10000;
      coloration = color(232, 211, 188);
      repertoireEnregistrement = "graduationSphereJupiter/####.png";
      break;

      case("Saturne"):
      mass = 568.46e24;
      semiMajorAxis = 1426700000;
      coordonnee = new PVector(1426700000, 0, 0);
      lowestPoint = 23000000;
      highestPoint = 26000000;
      radius = 58232;
      increment = 1000;
      coloration = color(214, 184, 120);
      repertoireEnregistrement = "graduationSphereSaturne/####.png";
      break;
      
      case("Uranus"):
      mass = 8.6810e25;
      semiMajorAxis = 2870700000L;
      coordonnee = new PVector(2870700000L, 0, 0);
      lowestPoint = 18850000;
      highestPoint = 19100000;
      radius = 25559;
      increment = 10000;
      coloration = color(139, 166, 177);
      repertoireEnregistrement = "graduationSphereUranus/####.png";
      break;

      case("Neptune"):
      mass = 102.43e24;
      semiMajorAxis = 4498400000L;
      coordonnee = new PVector(4498400000L, 0, 0);
      lowestPoint = 32000000;
      highestPoint = 32520000;
      radius = 24341;
      increment = 1000;
      coloration = color(118, 178, 251);
      repertoireEnregistrement = "graduationSphereNeptune/####.png";
      break;

      case("Pluton"):
      mass = 1.314e22;
      semiMajorAxis = 5900898440L;
      coordonnee = new PVector(5900898440L, 0, 0);
      lowestPoint = 479000;
      highestPoint = 490000;
      radius = 1185;
      increment = 1;
      coloration = color(178, 145, 114);
      repertoireEnregistrement = "graduationSpherePluton/####.png";
      break;

      case("Egg"):
      mass = 9.891e29;
      semiMajorAxis = 5790923;
      coordonnee = new PVector(5790923, 0, 0);
      lowestPoint = 2390000;
      highestPoint = 14000000;
      radius = 500000;
      increment = 1000;
      coloration = color(214, 184, 120);
      repertoireEnregistrement = "graduationSphereEgg/####.png";
      break;
    }
  }
}
