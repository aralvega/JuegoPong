class PaletaJugador extends Paleta{
  private boolean mueveArriba;
  private boolean mueveAbajo;
  
  
  public PaletaJugador(){
     super();
     this.mueveArriba = false;
     this.mueveAbajo = false;
  }
  
  @Override
  public void dibujar(){
    fill(#EAC763);
    super.dibujar();
  }
  
  public void mover(){
    float tasaMovimiento = this.velocidad.y*Time.getDeltaTime();
    if(this.mueveArriba){
      this.posicion.y-=tasaMovimiento;
    }
    if(this.mueveAbajo){
      this.posicion.y+=tasaMovimiento;
    }
    this.posicion.y = constrain(this.posicion.y,0+this.alto/2,height-this.alto/2);
  }
  
  public boolean isMueveArriba(){
    return this.mueveArriba;
  }
  
  public void setMueveArriba(boolean mueveArriba){
    this.mueveArriba = mueveArriba;
  }
  
  public boolean isMueveAbajo(){
    return this.mueveAbajo;
  }
  
  public void setMueveAbajo(boolean mueveAbajo){
    this.mueveAbajo = mueveAbajo;
  }
  
}
