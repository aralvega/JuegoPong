class Pelota{
  private PVector posicion;
  private PVector velocidad;
  private int radio;
  private float velocidadMagnitude;
  private float maxBounceAngle;
  
  public Pelota(){
    resetEstado();
    this.radio = 10;
    this.velocidadMagnitude = 250;
    this.maxBounceAngle = PI/4;
  }
  
  private void resetEstado(){
    posicion = new PVector(width/2,height/2);
    // Dirección: derecha o izquierda
    float direccionEjeX = random(1) < 0.5 ? 1 : -1;
  
    // Ángulo Y: un poco hacia arriba o abajo
    float anguloY = random(-0.5, 0.5);

    this.velocidad = new PVector(200 * direccionEjeX, 200 * anguloY);
  }
  
  public void validarReboteParedesHorizontales(){
    if(this.posicion.y-radio <= 0){
      this.velocidad.y*=-1;
      this.posicion.y = this.radio; // Reposiciona justo dentro para evitar el arrastre contra pared superior
    }
    
    if(posicion.y+radio >=height){
      this.velocidad.y*=-1;
      this.posicion.y = height -this.radio; // Reposiciona justo dentro para evitar el arrastre contra pared inferior
    }
    
  }
  
  public void validarColision(Paleta paleta){
    // Punto más cercano del rect
    float closestX = constrain(this.posicion.x, paleta.getPosicion().x - paleta.getAncho()/2, paleta.getPosicion().x + paleta.getAncho()/2);
    float closestY = constrain(this.posicion.y, paleta.getPosicion().y - paleta.getAlto()/2, paleta.getPosicion().y + paleta.getAlto()/2);

    // Distancia del centro del círculo a ese punto
    float distX = this.posicion.x - closestX;
    float distY = this.posicion.y - closestY;
    
    float distancia = sqrt(distX * distX + distY * distY);
    
    if (distancia < this.radio) {
      // Invertir X → rebote frontal
      if (abs(distX) > abs(distY)) {
        this.velocidad.x *= -1;

        // Ajustar ángulo de rebote según punto de impacto
        float relativeY = paleta.getPosicion().y - this.posicion.y;
        float normalizedY = relativeY / (paleta.getAlto()/2);
        float bounce = normalizedY * maxBounceAngle;

        float dir = this.velocidad.x > 0 ? 1 : -1;
        this.velocidad.x = velocidadMagnitude * cos(bounce) * dir;
        this.velocidad.y = velocidadMagnitude * -sin(bounce);

        // Reposicionar fuera del rect
        if (this.velocidad.x > 0) {
          this.posicion.x = paleta.getPosicion().x + paleta.getAncho()/2 + this.radio;
        } else {
          this.posicion.x = paleta.getPosicion().x - paleta.getAncho()/2 - this.radio;
        }

      } else {
        // Rebote vertical (raro, pero posible en esquinas)
        this.velocidad.y *= -1;
      }
    }
    
  }
  
  public void mover(){
    this.posicion.x+=this.velocidad.x*Time.getDeltaTime();
    this.posicion.y+=this.velocidad.y*Time.getDeltaTime();
    
    validarReboteParedesHorizontales();
    
  }
  
  public void dibujar(){
    fill(#E5F25F);
    circle(this.posicion.x,this.posicion.y,this.radio*2);
  }
  
  public PVector getPosicion(){
    return this.posicion;
  }
  
}
