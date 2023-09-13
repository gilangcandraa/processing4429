PImage astro;
float astroX, astroY; 
float astroVX, astroVY; 
float gravity = 0.5; 
boolean dragging = false; 

void setup() {
  size(800, 600);
  astro = loadImage("astronut.png");
  astroX = width / 2;
  astroY = height / 2;
  astroVX = 0;
  astroVY = 0;
}

void draw() {
  background(0);

  if (dragging) {
    
    astroX = mouseX;
    astroY = mouseY;
    astroVX = 0;
    astroVY = 0;
  } else {
    
    astroVY += gravity;
    astroX += astroVX;
    astroY += astroVY;
    
    
    if (astroY + astro.height / 2 > height) {
      astroY = height - astro.height / 2;
      astroVY *= -0.7; 
    }
  }

  imageMode(CENTER);
  image(astro, astroX, astroY);

  fill(#DB0000);
  textAlign(CENTER, BOTTOM);
  textSize(40);
  text("1 Impostor Among Us", width / 2, 50);
  
  fill(#FFE8E8);
  textAlign(CENTER,TOP );
  textSize(20);
  text("21.11.4429 Gilang Candra Adityas", width / 2, 400);
}

void mousePressed() {
  float d = dist(mouseX, mouseY, astroX, astroY);
  if (d < astro.width / 2) {
    dragging = true;
  }
}

void mouseReleased() {
  dragging = false;
}
