class JugandoState implements GameState{
  private Game game;
  private PaletaJugador paletaJugador;
  private PaletaCPU paletaCPU;
  private Pelota pelota;
  
  public JugandoState(Game game){
    this.game = game;
    this.paletaJugador = new PaletaJugador();
    this.paletaCPU = new PaletaCPU();
    this.pelota = new Pelota();
  }
  
  public void update(){
    this.paletaJugador.mover();
    this.pelota.mover();
    this.pelota.validarColision(this.paletaJugador);
    this.pelota.validarColision(this.paletaCPU);
    this.paletaCPU.mover(this.pelota);
  }
  
  public void render(){
    background(0);
    this.paletaJugador.dibujar();
    this.pelota.dibujar();
    this.paletaCPU.dibujar();
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
