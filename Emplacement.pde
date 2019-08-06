class emplacement {
  PVector position;
  float rho;
  DoubleList attractionList = new DoubleList();
  double attractionPlanete;
  double attractionSoleil;

  emplacement(PVector position) {
    this.position = position;
    attractionPlanete = 0;
    attractionSoleil = 0;
    rho = 0;
  }

  void force(PVector soleil, PVector terre, float mass) {
    attractionSoleil = 6.67e-11*1.9891e30/pow(soleil.dist(this.position)*1000, 2);
    attractionPlanete = 6.67e-11*mass/pow(terre.dist(this.position)*1000, 2);
  }

  boolean inSphere(ArrayList<objetCeleste> plane) {
    double G = 6.67408e-11;
    double attraction = 0;
    for (objetCeleste i : plane) {
      attraction = G*i.mass/pow(i.coordonnee.dist(this.position)*1000, 2);
      attractionList.append(attraction);
    }
    
    for (double i : attractionList) {
      if (attractionList.get(0) != i && attractionList.get(0) < i){
        return false;
      }
    }
    return true;
  }

  void copy(emplacement point) {
    this.position = point.position.copy();
    this.attractionPlanete = point.attractionPlanete;
    this.attractionSoleil = point.attractionSoleil;
    this.rho = point.rho;
  }
  
  void nCopy(emplacement point){
    this.position = point.position.copy();
    this.rho = point.rho;
    this.attractionList = point.attractionList.copy();
  }
}
