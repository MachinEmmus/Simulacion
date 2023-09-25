float x = 0; // Posición inicial x
float y = 50; // Posición inicial y
float speedX = 2; // Velocidad en dirección x
float speedY = 10; // Velocidad en dirección y
float arrowSize = 30; // Tamaño de la flecha

void setup() {
  size(400, 200); // Define el tamaño de la ventana
  background(255); // Fondo blanco
}

void draw() {
  // Limpia el fondo para evitar trazas de la flecha
  background(255);
  
  // Calcula el ángulo de la flecha según la dirección de movimiento
  float angle = atan2(speedY, speedX);
  
  // Dibuja una flecha en la posición actual de x, y con la dirección correcta
  drawArrow(x, y, arrowSize, angle);
  
  // Mueve la flecha
  x += speedX;
  y += speedY;
  
  // Si la flecha llega a los bordes de la ventana, cambia de dirección
  if (x > width || x < 0) {
    speedX *= -1; // Invierte la dirección horizontal
  }
  
  if (y > height || y < 0) {
    speedY *= -1; // Invierte la dirección vertical
  }
}

void drawArrow(float x, float y, float size, float angle) {
  // Dibuja una flecha en la posición x, y con un tamaño dado y la dirección especificada
  fill(0); // Color negro
  noStroke();
  pushMatrix();
  translate(x, y);
  rotate(angle);
  
  // Cuerpo de la flecha
  rect(-size / 12, -size / 2, size / 6, size);
  
  // Punta de la flecha
  triangle(-size / 2, -size / 2, size / 2, 0, -size / 2, size / 2);
  
  popMatrix();
}
