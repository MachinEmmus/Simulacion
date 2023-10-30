abstract class Pixel {
  abstract String getLetter();  
}

class RedPixel extends Pixel {
  public String getLetter() {
    return "R";
  }
}

class GreenPixel extends Pixel {
  public String getLetter() {
    return "V";
  }
}

class OtherPixel extends Pixel {
  public String getLetter() {
    return " ";
  }
}

class PixelFactory {
  private float red;
  private float green;
  private float blue;
  
  public PixelFactory(color pixelColor) {
    this.red = red(pixelColor);
    this.green = green(pixelColor);
    this.blue = blue(pixelColor);
  }
  
  private boolean isRed() {
    return this.red > 180 && this.green < 150 && this.blue < 150;
  } 
  
  private boolean isGreen() {
    return this.green > 180 && this.red < 150 && this.blue < 150;
  }
  
  public Pixel getPixel() {
    if(isRed()) {
      return new RedPixel();
    } else if(isGreen()) {
      return new GreenPixel();    
    } else {
      return new OtherPixel();
    } 
  }  
  
}

class HandleImage {
  private PImage image;
  private Table table;
  private TableRow[] rows;

  public HandleImage(PImage image, Table table) {
    this.image = image;
    this.table = table;
    this.rows = new TableRow[image.height];
  }
  
  private void generateColumns() {
       for(int i = 0; i < image.width; i++) {
         this.table.addColumn(str(i));
       }
  } 
  
  private void generateRows() {
    for(int j = 0; j < image.height; j++) {
      rows[j] = this.table.addRow();
    }
  }
  
  public void generateTable() {
    generateColumns();
    generateRows();
  }
  
  public void setTable() {
     for(int i = 0; i < image.width; i++) {
       for(int j = 0; j < image.height; j++) {
         String letter = new PixelFactory(image.get(i, j)).getPixel().getLetter();
         this.rows[j].setString(str(i), letter);
       }
       println("");
     }
  }
  
  public void saveTableIntoCsv() {
    saveTable(this.table, "velas.csv");
  }
  
}
