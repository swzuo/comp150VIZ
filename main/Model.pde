public abstract class Model{
  private final ArrayList<View> canvas = new ArrayList<View>();
  
  public void attach(View other){
    canvas.add(other);
  }
  
  public void detach(View other){
    canvas.remove(other);
  }
  
  public void notify(){
    for(View o : canvas ){
      o.update();
    }
//    println("notify");
  }
}
