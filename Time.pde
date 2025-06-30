static class Time{
  private static float deltaTime;
  private static int lastTime;
  
  public static void update(int currentTime){
    deltaTime = (currentTime - lastTime)/1000.0;
    lastTime = currentTime;
  }
  
  public static float getDeltaTime(){
    return deltaTime;
  }
  
  public static void setLastTime(int
  xLastTime){
    lastTime = xLastTime;
  }
  
}
