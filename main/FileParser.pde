class FileParser extends Model{
  private String[] ids;
  private String[] actions;
  private int[] labels;
  private int[] countsOfAction;
  private String[] mission1;
  private String[] mission2;
  private String[] mission3;
  private String[] mission4;
  private int[] usersMissionNum;
  private int[][] allActionNum;
  private int[] index;
  private boolean updata;
  
  public FileParser(String fileName){
    String lines[] = loadStrings(fileName);
    ids = new String[lines.length];
    actions = new String[lines.length];
    labels = new int[lines.length];
    index = new int[lines.length];
    for(int i = 0; i < lines.length; i++){
      String[] oneRow = split(lines[i],',');
      ids[i] = oneRow[0];
      actions[i] = oneRow[1];
      labels[i] = int(oneRow[2]);
      index[i] = i;
    }
    updata = false;
  }
 
  public void seperateMission(){
    int size = ids.length;
    mission1 = new String[size];
    mission2 = new String[size];
    mission3 = new String[size];
    mission4 = new String[size];
    countsOfAction = new int[size];
    usersMissionNum = new int[size];
    int sortOpr = 8;
    allActionNum = new int[size][sortOpr];
    for(int i = 0; i < size; i++){
      String[] oneAction = actions[i].split("\\s+");
      countsOfAction[i] = oneAction.length;
      
      String oprs1 ="C T P G"; 
      String oprs2 ="U-S U-C U-M U-G";
      String[] oprArray1 = oprs1.split("\\s+");
      for(int k = 0; k < oprArray1.length; k++){
//        allActionNum[i][k] = actions[i].split(" "+oprArray1[k]+" ").length - 1;
          allActionNum[i][k] = match(actions[i],"["+oprArray1[k]+"]").length - 1;
      }
      String[] oprArray2 = oprs2.split("\\s+");
      for(int k = 0; k < oprArray2.length; k++){
//        allActionNum[i][k+oprArray1.length] = actions[i].split(oprArray2[k]).length - 1;
          allActionNum[i][k+oprArray1.length] = match(actions[i],"["+oprArray2[k]+"]").length - 1;
      }
      println(ids[i]);
      for(int j = 0; j < sortOpr; j++){
        print(allActionNum[i][j]+" ");
      }
      println();
//      int[] counter = new int[sortOpr];
//      int counter[0] = actions[i].split(" C ").length - 1;
//      int counter[1] = actions[i].split(" T ").length - 1;
//      int counter[2] = actions[i].split("U-S").length - 1;
//      int counter[3] = actions[i].split("U-C").length - 1;
//      int counter[4] = actions[i].split("U-M").length -1;
//      int counter[5] = actions[i].split("U-G").length - 1;
//      int counter[6] = actions[i].split(" P ").length - 1;
//      int counter[7] = actions[i].split(" G ").length - 1;
      
      
      if(labels[i] == 0){
//        println(ids[i]);
        
        String[] missionsStr = split(actions[i]," M M ");
        usersMissionNum[i] = 3;
//        println(usersMissionNum[i]);
        mission1[i] = trim(missionsStr[0]);
        mission1[i] = mission1[i].substring(2);
//        println();
//        println(mission1[i]);
        mission2[i] = trim(missionsStr[1]);
//        println();
//        println(mission2[i]);
        mission3[i] = trim(missionsStr[2]);
//        println();
//        println(mission3[i]);
        mission4[i] = trim(missionsStr[3]);
//        println();
//        println(mission4[i]);
//        println();
      }else{
//        println(ids[i]);
        String[] missionsStr = split(actions[i]," M M ");
        usersMissionNum[i] = missionsStr.length-1;
//        println(usersMissionNum[i]);
      }
    }
  }
  
  
}
