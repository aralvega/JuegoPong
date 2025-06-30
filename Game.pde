class Game{
  private GameState estadoActual;
  
  public Game(){
    estadoActual = new InicioState(this);
    Time.setLastTime(millis());
  }
  
  public void setState(GameState nuevoEstado){
    estadoActual = nuevoEstado;
  }
  
  public void update(){
    estadoActual.update();
  }
  
  public void render(){
    estadoActual.render();
  }
  
  public void handleKeyPressed(){
    estadoActual.handleKeyPressed();
  }
  
  public void handleKeyReleased(){
    estadoActual.handleKeyReleased();
  }
  
}
