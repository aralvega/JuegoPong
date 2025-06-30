class JugandoState implements GameState{
  private Game game;
  
  public JugandoState(Game game){
    this.game = game;
  }
  
  public void update(){
  }
  
  public void render(){
    background(50);
    fill(255);   
    textAlign(CENTER, CENTER);
    textSize(24);
    text("¡Jugando!", width/2, height/2);
  }
  
  public void handleKeyPressed(){
  }
}
