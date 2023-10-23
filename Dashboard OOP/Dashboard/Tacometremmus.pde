//Developer: Emmanuel Monsalve
//Date: 04 de Septiembre 2023
//9 Tacometros

// Clase para el Tacometro
class Tacometro {
  float x, y;
  float radius;
  float valor;
  color colorFondo;

  Tacometro(float x, float y, float radius, color colorFondo) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.valor = 0; // Valor inicial del tacómetro
    this.colorFondo = colorFondo;
  }

  void mostrar() {
    // Dibujar la mitad del tacómetro (180 grados)
    pushMatrix();
    translate(x, y);
    rotate(PI);
    fill(colorFondo);
    arc(0, 0, radius * 2, radius * 2, 0, PI);
    
    // Dibujar la aguja indicadora
    float angulo = map(valor, 0, 100, PI, 0);
    float xAguja = cos(angulo) * radius;
    float yAguja = sin(angulo) * radius;
    line(0, 0, xAguja, yAguja);
    
    // Dibujar números alrededor del tacómetro 
    textSize(14);
    textAlign(CENTER, CENTER);
    fill(0);
    for (int i = 0; i <= 10; i++) {
      float numAngulo = map(i, 0, 10, PI, 0); // Ajustar el ángulo para que los números estén en el orden correcto
      float xNum = cos(numAngulo) * (radius + 20); // Ajustar la distancia de los números desde el centro
      float yNum = sin(numAngulo) * (radius + 20);
      pushMatrix();
      translate(xNum, yNum);
      rotate(PI); // Girar 180 grados
      text(i * 10, 0, 0);
      popMatrix();
    }
    
    popMatrix();
  }

  void actualizar(float nuevoValor) {
    // Actualizar el valor del tacómetro
    valor = nuevoValor;
  }
}

// Clase para el Dashboard
class Dashboard {
  Tacometro[] tacometros = new Tacometro[9];

  Dashboard() {
    // Crear 9 tacómetros en diferentes posiciones y colores
    float xOffset = width / 4;
    float yOffset = height / 4;
    float spacingX = width / 4;
    float spacingY = height / 4;
    int contador = 0;
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        float x = xOffset + col * spacingX;
        float y = yOffset + row * spacingY;
        color colorFondo = color(random(255), random(255), random(255));
        tacometros[contador++] = new Tacometro(x, y, 50, colorFondo);
      }
    }
  }

  void mostrar() {
    // Muestrar todos los tacómetros en el dashboard
    for (int i = 0; i < 9; i++) {
      tacometros[i].mostrar();
    }
  }

  void actualizarTacometro(int indice, float nuevoValor) {
    // Actualizar un tacómetro específico por índice
    if (indice >= 0 && indice < 9) {
      tacometros[indice].actualizar(nuevoValor);
    }
  }
}

Dashboard dashboard;

void setup() {
  size(800, 800);
  background(255);
  
  // Crea el dashboard
  dashboard = new Dashboard();
}

void draw() {
  background(255);
  
  // Mostrar el dashboard
  dashboard.mostrar();
  
  // Agregar un mensaje de instrucciones
  fill(0);
  textSize(16);
  textAlign(LEFT);
  text("Presiona las teclas del 1 al 9 para actualizar los tacómetros individuales.", 20, height - 40);
  text("Presiona la tecla '0' para generar valores aleatorios en todos los tacómetros.", 20, height - 20);
}

void keyPressed() {
  // Si se presiona la tecla '0', generar un valor aleatorio para todos los tacómetros
  if (key == '0') {
    for (int i = 0; i < 9; i++) {
      float nuevoValor = random(0, 100);
      dashboard.actualizarTacometro(i, nuevoValor);
    }
  } 
  // Si se presiona una tecla del 1 al 9, actualizar un tacómetro específico
  else {
  // Actualizar un tacómetro al presionar una tecla (teclas 1-9)
    int indiceTacometro = key - '1';
    if (indiceTacometro >= 0 && indiceTacometro < 9) {
      float nuevoValor = random(0, 100);
      dashboard.actualizarTacometro(indiceTacometro, nuevoValor);
    }
  }
}
