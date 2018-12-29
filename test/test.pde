PImage[] img;
int sum = 6;
int num = 0;

void setup() {
  size(600, 600);
  img = new PImage[sum];
  for (int i=0; i<sum; i++) {
    img[i] = loadImage(i+1+".jpg");
  }
}

void draw() {

  if (num>=sum) {
    num = 0;
  }
  image(img[num], 0, 0, 400, 400);

  if (frameCount%8 == 0) {
    num++;
  }
}
