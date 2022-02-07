int myMouseX, myMouseY;
int sizing, rotation;
float resize, rerotation;
int len;
int x, y, opacity;
int r, g, b;
boolean rup, rdown, gup, gdown, bup, bdown;

boolean growing, shrinking;
boolean rleft, rright;
public void setup()
{
  size(700, 700);
  
  sizing = 40;
  rotation = 0;
  len = 320;
  
  x = width/2-len/2;
  y = height/2+len/2;
  opacity = 6;
  
  growing = false;
  shrinking = false;
  rleft = false;
  rright = false;
  
  resize = 0.0;
  rerotation = 0.0;
  
  r = 0;
  g = 0;
  b = 0;
  rup = false;
  gup = false;
  bup = false;
  rdown = false;
  gdown = false;
  bdown = false;
}
public void draw()
{
  if (mousePressed){
    int xDiff = mouseX - myMouseX;
    int yDiff = mouseY - myMouseY;
    
    x += xDiff;
    y += yDiff;
  } else {
    
  }
  myMouseX = mouseX;
  myMouseY = mouseY;
  
  
  fill(255, opacity);
  rect(0, 0, width, height);
  
  if (growing){
    len+=2;
    resize+=0.1;
  }
  if (shrinking){
    len-=2;
    resize-=0.1;
  }
  len += resize;
  if (len < sizing * 2)
    len = sizing * 2;
  
  if (rleft){
    rotation--;
    rerotation-=0.1;
  }
  if (rright){
    rotation++;
    rerotation+=0.1;
  }
  
  if (rup){
    if (r < 255)
      r++;
  }
  if (rdown){
    if (r > 0)
      r--;
  }
  if (gup){
    if (g < 255)
      g++;
  }
  if (gdown){
    if (g > 0)
      g--;
  }
  if (bup){
    if (b < 255)
      b++;
  }
  if (bdown){
    if (b > 0)
      b--;
  }
  
    
  rotation += rerotation;
  
  stroke(r, g, b);
  fill(r, g, b);
  
  translate(width/2, height/2);
  rotate(radians(rotation));
  sierpinski(x-width/2, y-height/2, len);
}

public void keyPressed(){
  if (keyCode == 38){
    growing = true;
  }
  if (keyCode == 40){
    shrinking = true;
  }
  if (keyCode == 37){
    rleft = true;
  }
  if (keyCode == 39){
    rright = true;
  }
  
  if (key == 'r')
    rup = true;
  else if (key == 't')
    rdown = true;
  
  if (key == 'g')
    gup = true;
  else if (key == 'h')
    gdown = true;
    
  if (key == 'b')
    bup = true;
  else if (key == 'n')
    bdown = true;
}
public void keyReleased(){
  if (keyCode == 38){
    growing = false;
    resize = 0.0;
  }
  if (keyCode == 40){
    shrinking = false;
    resize = 0.0;
  }
  if (keyCode == 37){
    rleft = false;
    rerotation = 0.0;
  }
  if (keyCode == 39){
    rright = false;
    rerotation = 0.0;
  }
  
  if (key == 'r')
    rup = false;
  if (key == 't')
    rdown = false;
  
  if (key == 'g')
    gup = false;
  if (key == 'h')
    gdown = false;
    
  if (key == 'b')
    bup = false;
  if (key == 'n')
    bdown = false;
    
  if (key == 'w'){
    if (opacity > 1)
      opacity--;
  }
  if (key == 's'){
    if (opacity < 255)
      opacity++;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  opacity -= e;
  if (opacity <= 1)
    opacity = 1;
}

public void sierpinski(int x, int y, int len) 
{
  if (len <= sizing){
    triangle(x, y, x+len, y, x+(len/2), y-len);
  } else {
    sierpinski(x, y, (len/2));
    sierpinski(x+(len/2), y, (len/2));
    sierpinski(x+len/4, y-(len/2), (len/2));
  }
}
