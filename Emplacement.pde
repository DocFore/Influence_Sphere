class emplacement {
  PVector position;
  float rho;
  double attractionPlanete;
  double attractionSoleil;
  
  emplacement(PVector position) {
    this.position = position;
    attractionPlanete = 0;
    attractionSoleil = 0;
    rho = 0;
  }
  
  void force(PVector soleil, PVector terre, float mass){
    attractionSoleil = 6.67e-11*1.9891e30/pow(soleil.dist(this.position)*1000,2);
    attractionPlanete = 6.67e-11*mass/pow(terre.dist(this.position)*1000,2);
  }
  
  void copy(emplacement point){
    this.position = point.position.copy();
    this.attractionPlanete = point.attractionPlanete;
    this.attractionSoleil = point.attractionSoleil;
    this.rho = point.rho;
  }
}
