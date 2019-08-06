objetCeleste origine; //<>// //<>// //<>//
ArrayList<objetCeleste> objet = new ArrayList<objetCeleste>();
ArrayList<emplacement> points = new ArrayList<emplacement>();
float angleX = 0;
float angleZ = 0;
int minimum = 50000000;
int maximum = 0;
int pmX = width/2;
int pmY = height/2;
boolean turn = true;


/*-------------------------
 Passage à la partie calcul
 ------------------------*/

void setup() {
  /*Assignation des planètes à étudier*/
  StringList nom = new StringList("Egg", "Soleil");
  for (String ajout : nom) {
    objet.add(new objetCeleste(ajout));
  }
  origine = objet.get(0);


  for (float  theta = 0; theta < 180; theta+=5) { // Ce morceau de code permet de dessiner la "sphère" d'influence de la planète.
    for (float  phi = 0; phi < 360; phi+=5) {


      emplacement previous = new emplacement(new PVector(origine.coordonnee.x-1, origine.coordonnee.y-1, origine.coordonnee.z-1));


      for (int rho = (int)origine.lowestPoint; rho < (int)origine.highestPoint; rho+=(int)origine.increment) {
        //println(rho + " " + theta + " " + phi);

        //on détermine les coordonnées
        float z = rho*cos(phi*PI/180)*cos(theta*PI/180);
        float y = rho*cos(phi*PI/180)*sin(theta*PI/180);
        float x = rho*sin(phi*PI/180);

        emplacement point = new emplacement(new PVector(origine.coordonnee.x+x, origine.coordonnee.y+y, origine.coordonnee.z+z));
        //cette fonction permet de trouver si le point étudier est dans la sphère d'influence de la planète étudiée.
        if (point.inSphere(objet)) {
          previous.copy(point);
        } else { //on cherche ici les points d'altitudes maximales et minimales pour créer ensuite le dégradé de couleur pour l'échelle
          if (rho<minimum) {
            minimum = rho;
          }
          if (rho>maximum) {
            maximum = rho;
          }
          previous.rho = rho;
          points.add(previous);
          break;
        }
      }
    }
    println("Progression : " + theta*100/180);
  }
  println(points.size());
  println(minimum);
  println(maximum);
  origine.lowestPoint = minimum;
  origine.highestPoint = maximum;
  origine.rapport = origine.highestPoint/414;
  background(0);
  fullScreen(P3D);
}



/*-------------------------
 Passage à la partie dessin
 ------------------------*/


void draw() {
  couleur c1 = new couleur(255, 51, 204);
  couleur c2 = new couleur(0, 102, 255);

  background(0);
  graduation(c1, c2);

  translate(960, 540, 0);
  rotateX(angleX);
  rotateZ(angleZ);
  stroke(origine.coloration);
  strokeWeight(origine.radius*2/origine.rapport);
  point(0, 0);
  strokeWeight(2);
  for (emplacement i : points) {
    float rouge = map(i.rho, origine.lowestPoint, origine.highestPoint, c1.R, c2.R);
    float vert = map(i.rho, origine.lowestPoint, origine.highestPoint, c1.G, c2.G);
    float bleu = map(i.rho, origine.lowestPoint, origine.highestPoint, c1.B, c2.B);
    stroke(rouge, vert, bleu, 128);
    point((i.position.x-origine.coordonnee.x)/origine.rapport, (i.position.y-origine.coordonnee.y)/origine.rapport, (i.position.z-origine.coordonnee.z)/origine.rapport);
  }
  
  if (turn == true) {
    angleX = PI/3;
    angleZ+=PI/300;
  }
  
  //if (angle < 2 *PI) {
  //  saveFrame(centre.repertoireEnregistrement);
  //}
}


void gradientRect(int x, int y, int w, int h, color c1, color c2) {
  strokeWeight(1);
  beginShape();
  fill(c1);
  vertex(x, y);
  vertex(x+w, y);
  fill(c2);
  vertex(x+w, y+h);
  vertex(x, y+h);
  endShape();
}
void graduation(couleur c1, couleur c2) {

  gradientRect(0, 0, 100, height, color(c1.R, c1.G, c1.B), color(c2.R, c2.G, c2.B));
  fill(255, 255, 255);
  text("Altitude des points en fonction de leur couleur par rapport au centre de " + origine.nom, 110, 25);

  for (int i = 0; i<height; i+=50) {
    float rouge = map(i, 0, height, c1.R, c2.R);
    float vert = map(i, 0, height, c1.G, c2.G);
    float bleu = map(i, 0, height, c1.B, c2.B);
    fill(rouge, vert, bleu);
    int altitude = (int)map(i, 0, height, origine.lowestPoint, origine.highestPoint);
    text(altitude + " km", 120, i);
  }
}

void mouseMoved() {
  pmX = mouseX;
  pmY = mouseY;
}

void mouseDragged() { // use to turn the shape while clicking
  int mX = mouseX;
  int mY = mouseY;
  int dX = pmX - mX;
  int dY = pmY - mY;
  turn = false;
  if (dX > 0) {
    angleZ += map(dX, 0, width, 0, 2*PI);
  } else {
    angleZ -= map(-dX, 0, width, 0, 2*PI);
  }
  if (dY > 0) {
    angleX += map(dY, 0, height, 0, PI);
  } else {
    angleX -= map(-dY, 0, height, 0, PI);
  }
  pmX = mouseX;
  pmY = mouseY;
}

void keyPressed() {
  if (key == ' ' || key == 'R' || key == 'r') {
    turn = !turn;
  }
}
