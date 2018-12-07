class MakeT {
  
  ArrayList<Float> myFloatData;
  Table table;
  Table myT;

  public MakeT(ArrayList<Float> md) {
    myFloatData = md;
    }

  void setup() {
  table = new Table();
  table.addColumn("error");
  for (int i=0; i < myFloatData.size(); i++){
    TableRow newRow = table.addRow();
    newRow.setString(1, myFloatData.get(i).toString());
  }
  this.myT = table;
  }
  
  void sT() {
    saveTable(this.myT, "data/new.csv", "csv");
  }
}
