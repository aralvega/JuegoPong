class JugandoState implements GameState{
  private Game game;
  private PaletaJugador paletaJugador;
  private PaletaCPU paletaCPU;
  private Pelota pelota;
  private HUD hud;
  private int puntajeMaximo;
  
  public JugandoState(Game game){
    this.game = game;
    this.paletaJugador = new PaletaJugador();
    this.paletaCPU = new PaletaCPU();
    this.pelota = new Pelota();
    this.hud = new HUD();
    this.puntajeMaximo=11;
  }
  
  public void update(){
    this.paletaJugador.mover();
    this.pelota.mover();
    this.pelota.validarColision(this.paletaJugador);
    this.pelota.validarColision(this.paletaCPU);
    if(this.pelota.validarChoqueParedVerticalDerecha()){
      this.paletaJugador.setPuntaje(this.paletaJugador.getPuntaje()+1);
      pelota.resetEstado();
      
    }
    if(this.pelota.validarChoqueParedVerticalIzquierda()){
      this.paletaCPU.setPuntaje(this.paletaCPU.getPuntaje()+1);
      pelota.resetEstado();
      
    }
    
    this.hud.visualizarPuntajes(paletaJugador.getPuntaje(),paletaCPU.getPuntaje());
    this.paletaCPU.mover(this.pelota);
    
    if(paletaJugador.getPuntaje()==this.puntajeMaximo){
      this.game.setState(new GanadorState(this.game,"Jugador"));
    }else if(paletaCPU.getPuntaje()==this.puntajeMaximo){
      this.game.setState(new GanadorState(this.game,"CPU"));
    }
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
