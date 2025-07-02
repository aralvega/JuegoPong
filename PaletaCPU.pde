class PaletaCPU extends Paleta{
  private float velocidadMaxima;
  
  public PaletaCPU(){
     super();
     this.posicion.x = width - 100;
     this.velocidadMaxima = 250;
  }
  
  @Override
  public void dibujar(){
    fill(#F02483);
    super.dibujar();
  }
  
  public void mover(Pelota pelota){
    if (pelota.getPosicion().y < this.posicion.y - 10) {
      this.posicion.y -= min(this.velocidad.y*Time.getDeltaTime(),this.velocidadMaxima*Time.getDeltaTime());
    } else if (pelota.getPosicion().y > this.posicion.y + 10) {
      this.posicion.y += min(this.velocidad.y*Time.getDeltaTime(),this.velocidadMaxima*Time.getDeltaTime());
    }
    this.posicion.y = constrain(this.posicion.y, 0 + alto/2, height - alto/2);
  }
}
