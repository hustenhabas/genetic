class Carro{
  private PVector pos = new PVector(width/2, height/2 );
  private PVector vel = new PVector();
  private PVector acc = new PVector();
  private int r = 40;
  Dna dna;
  public Carro(float[] father) {
    if (father == null) {
      this.dna = new Dna(null);
    } else {
      this.dna = new Dna(father);
    }
  }
  public float[] getDna() {
  
    return this.dna.angles;
  }
  void show() {
    rect(this.pos.x, this.pos.y, this.r, this.r*2);
  }
  void update(int span) {
    PVector ac = PVector.fromAngle(radians(this.getDna()[span -1]));
    ac.setMag(1);
    this.applyForce(ac);
    this.vel.add(acc);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }
  void applyForce(PVector force) {
    this.acc.add(force);
  }
  void reset() {
    this.pos.set(width/2, height/2 );
    this.vel.mult(0);
  }
  public class Dna {
    float[] angles = new float[100];
    public Dna(float[] father) {
      if (father == null) {
   
      for (int i = 0; i < angles.length -1; i++) {
        angles[i] = random(0, 360);
      
      }
    } else {
      for (int i = 0; i < angles.length -1; i++) {
        angles[i] = angles[i] + random(0,100);
      }
    }
  }
  
  }
}
