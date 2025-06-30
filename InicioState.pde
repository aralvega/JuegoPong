class InicioState implements GameState{
  private Game game;
  
  public InicioState(Game game){
    this.game = game;
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
    text("JUEGO PONG", width/2, height/2-50);
    text("Presione [SPACE] para comenzar", width/2, height/2);
  }
 
  public void handleKeyPressed(){
    if(keyCode==32){
      game.setState(new JugandoState(game));
    }
  }
  
}
