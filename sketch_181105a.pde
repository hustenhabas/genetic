import java.util.Iterator; 
ArrayList<Carro> carros = new ArrayList<Carro>();
ArrayList<float[]> majinboo = new ArrayList<float[]>();
float media = 0;
ArrayList<Carro> carrosNew = new ArrayList<Carro>();
int lifespan = 100;
PVector alvo = new PVector(400, 50);
void setup() {
  size(800,600);
  for (int i = 0; i < 20; i++) {
    Carro carro = new Carro(null);
    carros.add(carro);
  }
}
void draw() {
  background(51);
  ellipse(alvo.x, alvo.y, 40, 40);
  checkLife(lifespan);
  for (Carro c: carros) {
      c.show();
      c.update(lifespan);
    }
    lifespan--;
  }
  public void checkLife(int n) {
    if (n <= 1) {
      //calcuila maxnota
      float maxNota = 0;
      for (int i = 0; i < 20; i++){
        float d = dist(alvo.x, alvo.y, carros.get(i).pos.x, carros.get(i).pos.y);
        float nota = map(d,0, width , width, 0);
        media += nota;
        if (nota > maxNota) {
          maxNota = nota;
        }
        //
      }
      
      for (int i = 0; i < 20; i++){
        float d = dist(alvo.x, alvo.y, carros.get(i).pos.x, carros.get(i).pos.y);
        float nota = map(d,0, width , width, 0);
        nota /= maxNota;
        print(nota+"   ");
        int vezes = floor(nota * 100);
        //print(vezes+"   ");
        for (int j = 0; j < vezes; j++) {
          majinboo.add(carros.get(i).getDna());
        }
        
        
      }
      for (int i = 0; i < 20; i++){
        Carro c1 = new Carro(majinboo.get(floor(random(majinboo.size()))));
        carrosNew.add(c1);
      }
      //print(media/20 + "    ");
      media = 0;
      
      majinboo.clear();
      carros.clear();
      carros = (ArrayList<Carro>) carrosNew.clone();
      carrosNew.clear();
      lifespan = 100;

    }
  }
  
  
  
