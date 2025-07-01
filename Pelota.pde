class Pelota{
  private PVector posicion;
  private PVector velocidad;
  private int radio;
  
  public Pelota(){
    resetEstado();
    radio = 10;
  }
  
  private void resetEstado(){
    posicion = new PVector(width/2,height/2);
    // Dirección: derecha o izquierda
    float direccionEjeX = random(1) < 0.5 ? 1 : -1;
  
    // Ángulo Y: un poco hacia arriba o abajo
    float anguloY = random(-0.5, 0.5);

    this.velocidad = new PVector(200 * direccionEjeX, 200 * anguloY);
  }
  
  public boolean validarReboteParedesHorizontales(){
    boolean rebota = false;
    if(this.posicion.y-radio <= 0 || posicion.y+radio >=height){
      rebota = true;
    }
    return rebota;
  }
  
  public void mover(){
    this.posicion.x+=this.velocidad.x*Time.getDeltaTime();
    this.posicion.y+=this.velocidad.y*Time.getDeltaTime();
    
    if(validarReboteParedesHorizontales()){
      this.velocidad.y*=-1;
    }
    
  }
  
  public void dibujar(){
    fill(#E5F25F);
    circle(this.posicion.x,this.posicion.y,this.radio*2);
  }
  
  public PVector getPosicion(){
    return this.posicion;
  }
  
}
