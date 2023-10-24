//Date: 10/10/2023
//Developer: Emmanuel Monsalve 
//Similitud Velas


PImage img1, img2;

void setup() {
  //size(900, 1000);
  fullScreen();
  img1 = loadImage("grfico-diario-de-velas-japonesas-sp-500.png");
  img2 = loadImage("Velas.jpg");  
}

void draw() {
  background(255);
  int topSeparation = 300;
  textAlign(CENTER);
  int[] histogram1 = calculateHistogram(img1);
  int[] histogram2 = calculateHistogram(img2);
  drawHistogram(histogram1, 100, 100 + topSeparation, color(255, 0, 0));
  drawHistogram(histogram2, 420, 100 + topSeparation, color(0, 0, 255));
  float similarity = calculateSimilarity(histogram1, histogram2);
  image(img1, 120, 150 + topSeparation);
  image(img2, 450, 150 + topSeparation);
  textSize(30);
  fill(255, 0, 0);
  text("Similitud De: " + nf(similarity, 0, 2) + "%", width/2, 130 + topSeparation);
}

int[] calculateHistogram(PImage img) {
int[] histogram = new int[256];
img.loadPixels();

for (int i = 0; i < img.pixels.length; i++) {
  int grayValue = (int) red(img.pixels[i]);
  histogram[grayValue]++;
}
  return histogram;
}

void drawHistogram(int[] histogram, int x, int y, color histogramColor) {
  stroke(histogramColor);
  for (int i = 0; i < histogram.length; i++) {
    line(x+i, y, x+i, y-histogram[i]);
  }
}

float calculateSimilarity(int[] histogram1, int[] histogram2) {
  int matches = 0;
  for (int i = 0; i < histogram1.length; i++) {
      if (histogram1[i] == histogram2[i]) {
      matches++;
    }
  }
  return ((float) matches / histogram1.length) * 100;
}
