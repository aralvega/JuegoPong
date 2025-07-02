class GanadorState implements GameState{
  private Game game;
  private String ganador;
  
  public GanadorState(Game game, String ganador){
    this.game = game;
    this.ganador = ganador;
  }
  
  public void update(){
  }
  
  public void render(){
    background(0);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(24);
    for(int i=40;i<=width-40;i+=20){
      text("*",i,30);
      text("*",i,height-30);
    }
    text(ganador + " HA GANADO", width/2, height/2-50);
    text("Presione [R] para reiniciar", width/2, height/2);
  }
 
  public void handleKeyPressed(){
    if(key=='R'){
      game.setState(new JugandoState(game));
    }
  }
  
  public void handleKeyReleased(){
    
  }
  
}
