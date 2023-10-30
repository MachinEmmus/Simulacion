HandleImage handleImage;
PImage photo;
Table csvTable;

void setup() {
  size(500, 500);
  csvTable = new Table();
  photo = loadImage("Velas.jpg");  
  handleImage = new HandleImage(photo, csvTable);
  handleImage.generateTable();
  handleImage.setTable();
  handleImage.saveTableIntoCsv();
  print("CSV SAVED");
}
