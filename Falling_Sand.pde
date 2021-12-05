
final int WIDTH = 256;
final int HEIGHT = 256;
final int SCALE =4;

final byte AIR = 0;
final byte ROCK = 1;
final byte SAND = 2;
final byte WATER = 3;

byte[] world;
PGraphics gfx;


void setup(){
 size(1024, 1024,P2D);
noSmooth();

 gfx = createGraphics(WIDTH,HEIGHT);
 ((PGraphicsOpenGL)g).textureSampling(2);
 world = new byte[WIDTH*HEIGHT];

 for (int y = HEIGHT-10; y<HEIGHT; ++y){
 for(int x=0;x<WIDTH;++x){
     world[coord(x,y)] = ROCK;
 }
 }
}

int coord(int x, int y){
    return x+y*WIDTH;
}

void draw(){
    gfx.beginDraw();
    gfx.loadPixels();
    for(int y = 0; y < HEIGHT; ++y){
        for(int x=0; x < WIDTH; ++x){
            color c;
            byte cur = world[coord(x,y)];
            switch(cur){
                case AIR: c = color(0,0,0); break;
                case ROCK: c = color(128,128,128); break;
                case WATER: c = color(0,0,255); break;
                case SAND: c = color(255,255,0); break;
                default : c = color(255,0,0); break;	
            }
            gfx.pixels[coord(x,y)] = c;
        }
    }
    gfx.updatePixels();
    gfx.endDraw();
    scale(SCALE);
    image(gfx,0,0);
}
