PImage image;
boolean windowResized = false;
int n=2;
void setup() {
  size(100, 100);
  image = loadImage("konan.png");
  image.loadPixels();
}
void draw() {
  if (!windowResized) {
    surface.setSize(image.width, image.height);
    windowResized = true;
    return;
  }
  //noLoop();
  background(0);
  loadPixels();
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      float b = brightness(image.pixels[y*width + x]);
      float b_random=b+random(-255/n,255/n);
      for(int i=0; i<n; i++){
        if(b_random>255*i/n){
          pixels[y*image.width+x]=color(255*i/(n-1));
        }
      }
    }
  }
  updatePixels();
  save("output.jpg");
}
void keyPressed(){
  if(keyCode==UP){
    n++;
  }
  if(keyCode==DOWN && n>2){
    n--;
  }
  println(n);
}