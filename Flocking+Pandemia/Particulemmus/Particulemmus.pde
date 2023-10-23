// Developer: Emmanuel Monsalve
// Date: 10 de septiembre
// Particulas


// Librería Processing
import java.util.ArrayList;

// Declaración de variables globales
ArrayList<Person> people; // ArrayList para almacenar personas
int numInfected = 100; // Número inicial de personas infectadas, (Se puede cambiar)

void setup() {
  size(800, 600); // Tamaño de la ventana de dibujo
  people = new ArrayList<Person>(); // Inicializa el ArrayList
  
  // Crea un conjunto de personas
  for (int i = 0; i < 1000; i++) { // Cantidad de personas (Se puede cambiar la cantidad)
    float x = random(width); // Posición X aleatoria dentro de la ventana
    float y = random(height); // Posición Y aleatoria dentro de la ventana
    
    // Determina si la persona está infectada (las primeras 'numInfected' personas lo están)
    boolean infected = i < numInfected;
    
    // Crea una persona y la agrega al ArrayList
    Person person = new Person(x, y, infected);
    people.add(person);
  }
}

void draw() {
  background(255); // Fondo blanco
  
  // Itera a través de las personas y actualiza, dibuja y gestiona sus interacciones
  for (Person person : people) {
    person.update(); // Actualiza la posición de la persona
    person.display(); // Dibuja la persona en su posición actual
    person.interact(people); // Gestiona las interacciones con otras personas
  }
}

// Definición de la clase Person
class Person {
  // Propiedades de una persona
  PVector position; // Posición (coordenadas X e Y)
  PVector velocity; // Velocidad y dirección
  float radius; // Radio (tamaño) de la persona
  boolean infected; // Indica si la persona está infectada
  color fillColor; // Color de relleno de la persona

  // Constructor de la clase Person
  Person(float x, float y, boolean isInfected) {
    position = new PVector(x, y); // Inicializa la posición
    velocity = PVector.random2D(); // Inicializa la velocidad de forma aleatoria
    radius = 5; // Tamaño de la persona
    infected = isInfected; // Establece si la persona está infectada
    // Establece el color de relleno en función de si está infectada o no
    fillColor = infected ? color(255, 0, 0) : color(0, 0, 255);
  }

  // Método para actualizar la posición de la persona
  void update() {
    position.add(velocity); // Actualiza la posición sumando la velocidad
    checkEdges(); // Comprueba si la persona ha llegado a los bordes y rebota si es necesario
  }

  // Método para comprobar si la persona ha llegado a los bordes de la ventana
  void checkEdges() {
    if (position.x < 0) {
      position.x = 0;
      velocity.x *= -1;
    } else if (position.x > width) {
      position.x = width;
      velocity.x *= -1;
    }
    if (position.y < 0) {
      position.y = 0;
      velocity.y *= -1;
    } else if (position.y > height) {
      position.y = height;
      velocity.y *= -1;
    }
  }

  // Método para gestionar las interacciones con otras personas
  void interact(ArrayList<Person> population) {
  }

  // Método para dibujar la persona en su posición actual
  void display() {
    noStroke(); // Sin contorno
    fill(fillColor); // Establece el color de relleno
    ellipse(position.x, position.y, radius * 2, radius * 2); // Dibuja una elipse en la posición actual
  }
}
