PVector soleil = new PVector(0, 0, 0); //<>//
PVector planete = new PVector(778340000, 0, 0);
int rapport = 60000;
float minimum = 50000000;
float maximum = 0;
int altitudeMoins = 0;
int altitudePlus = 0;
//int rho = 23326000; //terre : 258740 jupiter : 23326168
int nbPointIn = 259200;
int nbPointOut = 0;
ArrayList<emplacement> points= new ArrayList<emplacement>();
float angle = 0;

void setup() {
  for (float  theta = 0; theta < 180; theta+=0.5) { // Ce morceau de code permet de dessiner la "sphère" d'influence de la planète.
    for (float  phi = 0; phi < 360; phi+=0.5) {
      PVector origine = new PVector(planete.x-1, 0, 0);
      emplacement previous = new emplacement(origine);
      previous.force(soleil, planete);
      for (float rho = 23326000; rho < 24820000; rho+=100) {
        float z = rho*cos(phi*PI/180)*cos(theta*PI/180);
        float y = rho*cos(phi*PI/180)*sin(theta*PI/180);
        float x = rho*sin(phi*PI/180);
        emplacement point = new emplacement(new PVector(planete.x+x, y, z));
        point.force(soleil, planete);

        if (point.attractionPlanete>point.attractionSoleil && previous.attractionPlanete > previous.attractionSoleil) {
          previous.copy(point);
        } else {
          if (rho<minimum) {
            minimum = rho;
          }
          if (rho>maximum) {
            maximum = rho;
          }
          previous.rho = rho;
          points.add(previous);
          //println(rho + " " + theta + " " + phi);
          break;
        }
      }
    }
    println(theta);
  }
  println(points.size());
  println(maximum);
  println(minimum);
  background(0);
  fullScreen(P3D);
}

void draw() {
  background(0);
  graduation();

  translate(960, 540, 0);
  rotateX(PI/3);
  rotateZ(angle);
  stroke(232, 211, 188);
  lights();
  sphere(69911/rapport);
  strokeWeight(1);
  for (emplacement i : points) {
    float rouge = map(i.rho, minimum, maximum, 0, 255);
    float bleu = map(i.rho, minimum, maximum, 255, 0);
    stroke(rouge, bleu, 0, 128);
    point((i.position.x-planete.x)/rapport, i.position.y/rapport, i.position.z/rapport);
  }
  angle+=PI/300;

  if (angle < 2 *PI) {
    saveFrame("graduationSphere/####.png");
  }

  //if (nbPointIn > 0) { //terre : 259690 jupiter : 24813408
  //fill(255, 255, 255);
  //text("Altitude de la sphère : " + rho + " km", 10, 25);
  //fill(255, 204, 0);
  //text("Nombre de point dans la sphère d'influence : " + nbPointIn, 10, 75);
  //text("Proportion de point dans la sphère : " + (float)(nbPointIn)*100/259200, 10, 100);
  //fill(0, 204, 255);
  //text("Nombre de point en dehors de la sphère d'influence : " + nbPointOut, 10, 150);
  //text("Proportion de point en dehors la sphère : " + (float)(nbPointOut)*100/259200, 10, 175);
  //nbPointIn = 0;
  //nbPointOut = 0;
  //for (float  theta = 0; theta < 180; theta+=0.5) { //Ce morceau de code permet de dessiner plusieurs sphères pour avoir une forme sous coupe de la sphère d'influence. NE PAS OUBLIER DE DÉCOMMENTER LE RHO A LA FIN DU CODE.
  //  for (float  phi = 0; phi < 360; phi+=0.5) {
  //    float x = rho*cos(phi*PI/180)*cos(theta*PI/180);
  //    float y = rho*cos(phi*PI/180)*sin(theta*PI/180);
  //    float z = rho*sin(phi*PI/180);
  //    emplacement point = new emplacement(new PVector(terre.x+x, y, z));
  //    point.force(soleil, planete);
  //    if (point.attractionPlanete>point.attractionSoleil) {
  //      stroke(255, 204, 0, 128);
  //      strokeWeight(1);
  //      nbPointIn++;
  //    } else {
  //      stroke(0, 204, 255, 64);
  //      strokeWeight(1);
  //      nbPointOut++;
  //    }
  //    point((point.position.x-terre.x)/rapport, point.position.y/rapport, point.position.z/rapport);
  //  }
  //}


  //if (nbPointIn != 0) {
  //  //saveFrame("influenceJupiter/####.png");
  //}
  //rho+=1000;
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
  fill(255,255,255);
  text("Couleur des points en fonction de leur altitude",110,25);

  for (int i = 0; i<height; i+=50) {
    float rouge = map(i, 0, height, 0, 255);
    float bleu = map(i, 0, height, 255, 0);
    fill(rouge, bleu, 0);
    int altitude = (int)map(i, 0, height, minimum, maximum);
    text(altitude + " km", 120, i);
  }
}
