private Game game;

public void setup(){
  size(800,600);
  game = new Game();
  frameRate(60);
}

public void draw(){
  int currentTime = millis();
  Time.update(currentTime);
  game.render();
  game.update();
  
}

public void keyPressed(){
  game.handleKeyPressed();
}

public void keyReleased(){
  game.handleKeyReleased();
}
