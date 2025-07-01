class HUD{
  
  public void visualizarPuntajes(int puntajeJugador, int puntajeCPU){
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(36);
    
    text(puntajeJugador, width/2 - 100, 100);
    text(puntajeCPU, width/2+100, 100);
  }
  
}
