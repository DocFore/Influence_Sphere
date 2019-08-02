class planete {
  float mass;
  float semiMajorAxis;
  float rapport;
  float highestPoint;
  float lowestPoint;
  float radius;
  float increment;
  color sol;
  String repertoireEnregistrement;
  String nom;

  planete(String name) {
    nom = name;
    switch(name) {
      
      case("Mercure"):
      
      mass = 3.3011e23;
      semiMajorAxis = 57909230;
      rapport = 60;
      lowestPoint = 23500;
      highestPoint = 23604;
      radius = 2439;
      increment = 1;
      sol = color(186, 186, 196);
      repertoireEnregistrement = "graduationSphereMercure/####.png";
      break;
      
      case("Venus"):
      mass = 4.8685e24;
      semiMajorAxis = 108209500;
      rapport = 400;
      lowestPoint = 169000;
      highestPoint = 169560;
      radius = 6051;
      increment = 1;
      sol = color(228, 227, 225);
      repertoireEnregistrement = "graduationSphereVenus/####.png";
      break;
    
      case("Terre"):
      nom = "la Terre";
      mass = 5.9736e24;
      semiMajorAxis = 149597887;
      rapport = 600;
      lowestPoint = 258740;
      highestPoint = 260000;
      radius = 6371;
      increment = 10;
      sol = color(6, 69, 173);
      repertoireEnregistrement = "graduationSphereTerre/####.png";
      break;
      
      case("Mars"):
      mass = 4.8685e24;
      semiMajorAxis = 227944000;
      rapport = 900;
      lowestPoint = 356040;
      highestPoint = 357180;
      radius = 3389;
      increment = 1;
      sol = color(235, 127, 91);
      repertoireEnregistrement = "graduationSphereMars/####.png";
      break;
      
      case("Jupiter"):
      mass = 1.8986e27;
      semiMajorAxis = 778340000;
      rapport = 60000;
      lowestPoint = 23326000;
      highestPoint = 24820000;
      radius = 69911;
      increment = 1000;
      sol = color(232, 211, 188);
      repertoireEnregistrement = "graduationSphereJupiter/####.png";
      break;
      
      case("Saturne"):
      mass = 568.46e24;
      semiMajorAxis = 1426700000;
      rapport = 59000;
      lowestPoint = 23770000;
      highestPoint = 24490000;
      radius = 58232;
      increment = 1000;
      sol = color(214, 184, 120);
      repertoireEnregistrement = "graduationSphereSaturne/####.png";
      break;
    }
  }
}
