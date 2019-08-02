planete objet = new planete("Terre"); //<>//



PVector soleil = new PVector(0, 0, 0);
PVector astre = new PVector(objet.semiMajorAxis, 0, 0); //terre 149597887 jupiter 778340000
ArrayList<emplacement> points= new ArrayList<emplacement>();
float angle = 0;
float minimum = 50000000;
float maximum = 0;




void setup() {
  for (float  theta = 0; theta < 180; theta+=0.5) { // Ce morceau de code permet de dessiner la "sphère" d'influence de la planète.

    for (float  phi = 0; phi < 360; phi+=0.5) {


      PVector origine = new PVector(astre.x-1, 0, 0);
      emplacement previous = new emplacement(origine);
      previous.force(soleil, astre, objet.mass);


      for (double rho = objet.lowestPoint; rho < (double)objet.highestPoint; rho+=(double)objet.increment) {
          //println(rho + " " + theta + " " + phi);


        float z = (float)rho*cos(phi*PI/180)*cos(theta*PI/180);
        float y = (float)rho*cos(phi*PI/180)*sin(theta*PI/180);
        float x = (float)rho*sin(phi*PI/180);

        emplacement point = new emplacement(new PVector(astre.x+x, y, z));
        point.force(soleil, astre, objet.mass);


        if (point.attractionPlanete>point.attractionSoleil && previous.attractionPlanete > previous.attractionSoleil) {
          previous.copy(point);
        } else {
          if (rho<minimum) {
            minimum = (float)rho;
          }
          if (rho>maximum) {
            maximum = (float)rho;
          }
          previous.rho = (float)rho;
          points.add(previous);
          break;
        }
      }
      //println(phi);
    }
    println(theta);
  }
  println(points.size());
  println(minimum);
  println(maximum);
  objet.lowestPoint = minimum;
  objet.highestPoint = maximum;
  background(0);
  fullScreen(P3D);
}



/*------------------------
 Passage à la partie dessin
 ------------------------*/



void draw() {
  background(0);
  graduation();

  translate(960, 540, 0);
  rotateX(PI/3);
  rotateZ(angle);
  stroke(objet.sol);
  strokeWeight(objet.radius*2/objet.rapport);
  point(0,0);
  strokeWeight(1);
  for (emplacement i : points) {
    float rouge = map(i.rho, objet.lowestPoint, objet.highestPoint, 0, 255);
    float bleu = map(i.rho, objet.lowestPoint, objet.highestPoint, 255, 0);
    stroke(rouge, bleu, 0, 128);
    point((i.position.x-astre.x)/objet.rapport, i.position.y/objet.rapport, i.position.z/objet.rapport);
  }
  angle+=PI/300;

  //if (angle < 2 *PI) {
  //  saveFrame(astre.repertoireEnregistrement);
  //}
}


void gradientRect(int x, int y, int w, int h, color c1, color c2) {
  beginShape();
  fill(c2);
  vertex(x, y);
  vertex(x+w, y);
  fill(c1);
  vertex(x+w, y+h);
  vertex(x, y+h);
  endShape();
}
void graduation() {

  gradientRect(0, 0, 100, height, color(255, 0, 0), color(0, 255, 0));
  fill(255, 255, 255);
  text("Altitude des points en fonction de leur couleur par rapport au centre de " + objet.nom, 110, 25);

  for (int i = 0; i<height; i+=50) {
    float rouge = map(i, 0, height, 0, 255);
    float bleu = map(i, 0, height, 255, 0);
    fill(rouge, bleu, 0);
    int altitude = (int)map(i, 0, height, objet.lowestPoint, objet.highestPoint);
    text(altitude + " km", 120, i);
  }
}
