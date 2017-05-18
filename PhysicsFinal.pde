float a = 0, xRad = 120, yRad = 120;
float vel = 0, rotSpeed = 0.0166, rot;
boolean newCirc;
float mX, mY;
int stage = 0;
float omega;


public void setup()
{
    background(0);
    size(700, 600);
}

public void draw()
{
  //omega = 2*PI/a;
  //System.out.println(omega);
  if (stage == 0)
  {
    startPage();
    if (newCirc == true)
    {
      //newCircMotion(mX, mY, a, a, xRad, yRad);
      stroke(255, 250, 100);
      fill(255, 250, 100);
      newCircMotion(width/2, height/2, a, a, xRad*2, yRad*2, 20);
      newCircMotion(width/2, height/2, a, a, xRad/2, yRad/2, 20);
    }
    //newCircMotion(mouseX, mouseY, a, a, 20, 20);
  }
  else
    circularMotion();
}

public void keyPressed()
{
  if (stage == 0)
  {
    stage = 1;
  }
  else if (stage == 1)
  {
    if (key == ' ')
    {
      if (yRad >= 0)
        yRad -= 0.5;
    }
    if (key == 'r')
    {
      stage = 0;
      yRad = 100;
    }
  }
}

public void mouseClicked()
{
  newCirc = !newCirc;
  stroke((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
  fill((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
  mX = mouseX;
  mY = mouseY;
}

public void startPage()
{
  background(70, 150, 255);
  
  stroke(255, 180, 50);
  fill(255, 180, 50);
  strokeWeight(2);
  //newCircMotion(mouseX, mouseY, a, a);
  newCircMotion(width/2, height/2, a, a, xRad, yRad, 20);
  newCircMotion(width/2, height/2 + 180, a, 1, xRad, yRad, 20);
  
  fill(255);
  textSize(30);
  text("   Relationship between", 185, 100);
  textSize(50);
  text("   Uniform Circular Motion &\n    Simple Harmonic Motion", 15, 160);
  textSize(20);
  text("   Press any key to continue.", 205, height-50);
}

public void newCircMotion(float xC, float yC, float aC, float aS, float radX, float radY, float r)
{
  float x = xC + cos(aC) * radX;
  float y = yC + sin(aS) * radY;

  ellipse(x, y, r, r);
  a = a + rotSpeed;
  if (a >= 2*PI)
    a = 0;
}

public void circularMotion()
{
  background(190);
  rot = (2/rotSpeed);
  
  noFill();
  strokeWeight(15);
  stroke(0, 15, 150);
  ellipse(width / 2, height / 2, xRad*2, yRad*2);
 
  stroke(0, 255, 0);
  fill(0, 255, 0);
  strokeWeight(2);
  newCircMotion(width/2, height/2, a, a, xRad, yRad, 15);
}
