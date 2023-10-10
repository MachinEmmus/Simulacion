//Desarrollado Por: Emmanuel Monsalve
// Fecha: 27 Agosto 2023
// derecha izquierda arriba abajo

int x = 800; // Posición inicial en x
int y = 25;   // Posición inicial en y
int speed = 8; // Velocidad de movimiento

void setup() {
  size(800, 600);
}

void draw() {
  background(220);
  
  // Dibuja un objeto en la posición (x, y)
  ellipse(x, y, 50, 50);
  
  // Actualiza la posición en x para el siguiente fotograma
  x = x - speed;
  
  // Si llega al borde izquierdo, baja y crea una nueva fila
  if (x < 0) {
    x = width - 50; // Asegura que no se salga de la ventana
    y = y + 50;     // Baja una fila
  }
  
  // Si llega al fondo, reinicia la posición en y y cambia la dirección
  if (y > height - 50) {
    y = 25;
  }
}
