class MakeT {
  
  ArrayList<Float> myFloatData;
  Table table;

  public MakeT() {
    myFloatData = new ArrayList<Float>();
    table = new Table();
    }

  void writeToTable() {
    table.addColumn("error");
    for (int i=0; i < myFloatData.size(); i++){
      TableRow newRow = table.addRow();
      newRow.setString(1, myFloatData.get(i).toString());
    }
  }
  
  void sT() {
    saveTable(table, "data/new.csv", "csv");
  }
}