float stickmanX = 200; // Posición horizontal del stickman
float stickmanY = 200; // Posición vertical del stickman

void setup() {
size(500, 500); // Tamaño del lienzo
}

void draw() {
background(220); // Fondo gris
// Cabeza
ellipse(stickmanX, stickmanY - 100, 60, 60);
// Cuerpo
line(stickmanX, stickmanY - 70, stickmanX, stickmanY + 50);
// Brazos
line(stickmanX - 40, stickmanY - 20, stickmanX, stickmanY - 50); line(stickmanX + 40, stickmanY - 20, stickmanX, stickmanY - 50);
// Piernas
line(stickmanX, stickmanY + 50, stickmanX - 40, stickmanY + 120); line(stickmanX, stickmanY + 50, stickmanX + 40, stickmanY + 120);
}

void keyPressed() {
  if (keyCode == LEFT) {
    stickmanX -= 10; // Mover hacia la izquierda 
  }
  else if (keyCode == RIGHT) {
    stickmanX += 10; // Mover hacia la derecha 
  } 
  else if (keyCode == UP) {
    stickmanY -= 10; // Mover hacia arriba
  } 
  else if (keyCode == DOWN) {
    stickmanY += 10; // Mover hacia abajo
  } 
}
