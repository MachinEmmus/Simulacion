//Desarrollado Por: Emmanuel Monsalve
// Fecha: 20 Agosto 2023
// Primeras 2 pelotas de un lado a otro

// Definición de varaibles

int x,y = 0;
int x2 = 800;

void setup(){
  size(800, 600);
}

void draw(){
  background(255);
  x+=4;
  x2-=4;
  ellipse(x,10,20,20);
  ellipse(x2,30,20,20);
  if (x == 800) {
    x = 0;
  }
  if (x2 == 0) {
    x2 = 800;
  }
}
