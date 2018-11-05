Carro carro;
int lifespan = 100;
PVector alvo = new PVector(width/2, 50);
void setup() {
  size(800,600);
  carro = new Carro(null);
  print(carro.getDna()[4]);
}
void draw() {
  //background(51);
  carro.show();
  if(lifespan > 0) {
    carro.update(lifespan);
    lifespan--;
  } else {
    lifespan = 100;
    Carro carro1 = carro;
    carro1 = new Carro(carro.getDna());
    carro.reset();
  }
}
