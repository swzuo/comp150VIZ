public abstract class Model{
  private final ArrayList<View> canvas = new ArrayList<View>();
  
  public void Attach(View other){
    canvas.add(other);
  }
  
  public void Detach(View other){
    canvas.remove(other);
  }
  
  public void Notify(){
    for(View o : canvas ){
      o.update();
    }
  }
}
