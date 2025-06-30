private Game game;

public void setup(){
  size(800,600);
  game = new Game();
}

public void draw(){
  game.update();
  game.render();
}

public void keyPressed(){
  game.handleKeyPressed();
}
