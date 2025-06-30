class JugandoState implements GameState{
  private Game game;
  private PaletaJugador paletaJugador;
  
  public JugandoState(Game game){
    this.game = game;
    this.paletaJugador = new PaletaJugador();
  }
  
  public void update(){
    this.paletaJugador.mover();
  }
  
  public void render(){
    background(0);
    this.paletaJugador.dibujar();
  }
  
  public void handleKeyPressed(){
    if(keyCode==UP) this.paletaJugador.setMueveArriba(true);
    if(keyCode==DOWN) this.paletaJugador.setMueveAbajo(true);
  }
  
  public void handleKeyReleased(){
    if(keyCode==UP) this.paletaJugador.setMueveArriba(false);
    if(keyCode==DOWN) this.paletaJugador.setMueveAbajo(false);
  }
}
