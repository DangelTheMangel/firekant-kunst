int xstart = 50;
int ystart = 50;
int b= 50; //bredde af firekant
int a = 10; //afstand mellem trekanter
int m = 6; //antal firkanter på x aksen
int n = 6; //antal af firekanter på y aksen
int o = 6;
int shake = 3; // bestemmer hvor meget firkenaterne kan ryKKe sig

void setup() {
  size(500, 500, P3D);
  camera(0, 0, -800, 0, 0, 0, 0, 1, 0);
}

void draw() {
  //renser billedet 
  clear();
  // rykker på vores kasse
  rotateX(100+mouseY/200.0);
  rotateY(100+mouseX/200.0);

//tegn omkring midten af kasse
  int startposX = (int)((m-1)/2.0 * a + (m/2.0) * b);
  int startposY = (int)((n-1)/2.0 * a + (n/2.0) * b);
  int startposZ = (int)((o-1)/2.0 * a + (o/2.0) * b);
  
  // dette er lyset der rammer kassen
  noStroke();
  directionalLight(200, 200, 180, .3, .3, 1);
  
  //tegning af kasserne 
  translate(-startposX, -startposY, -startposZ);
  for (int k=0; k<o; ++k) {
    for (int j=0; j<n; ++j) {
      for (int i=0; i<m; ++i) {
        int x = xstart + i*b + i*a;
        int d = (int)random(-shake, shake);
        fill(255, 0, 0);
        translate(b+a, 0, 0);
        translate(d, d, d);
        box(b);
        translate(-d, -d, -d);
      }
      translate(-m*(b+a), b+a, 0);
    }
    translate(0, -n*(b+a), (b+a));
  }
 
}

//spørg hvordan man flytter origan
