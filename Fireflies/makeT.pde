class makeT {
  ArrayList<Float> myFloatData;
  Table table;
  Table myT;

  makeT(ArrayList<Float> md) {
    this.myFloatData = md;
    }

  void setup() {
  table = new Table();
  for (int i=0; i < myFloatData.size(); i++){
    table.addColumn(myFloatData.get(i).toString());
  }
  this.myT = table;
  }
  
  void sT() {
    saveTable(this.myT, "data/new.csv", "csv");
  }
}
