class Paleta{
  protected PVector posicion;
  protected PVector velocidad;
  protected int ancho;
  protected int alto;
  
  public Paleta(){
    this.posicion = new PVector(100,100);
    this.velocidad = new PVector(0,400);
    this.ancho = 30;
    this.alto=80;
  }
  
  public void dibujar(){
    rectMode(CENTER);
    noStroke();
    rect(this.posicion.x,this.posicion.y,this.ancho,this.alto);
  }
  
  public PVector getPosicion(){
    return this.posicion;
  }
  
  public int getAncho(){
    return this.ancho;
  }
  
  public int getAlto(){
    return this.alto;
  }
}
