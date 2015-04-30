import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import java.util.Map;

Minim minim;
AudioPlayer pl_1;

GSPlay gsplay;
GSTitle gstitle;
GSResult gsResult;
GSCareerSelect gsCareer;

boolean paused = false;

/////////////////////////////////////////////////////////////////////////////////////////////

String gamePath;

// can make into an array
PImage circuit1;
PImage circuit2;

PImage volt;
PImage resist;

PImage checkNon;
PImage checkPos;
PImage checkNeg;

PImage home;
PImage reset;
PImage speech;

PImage speechL;
PImage speechS;
PImage arrow;
PImage arrowBtn;

PImage mouseD;
PImage mouseG;
PImage mouseN;


PImage genBtn;


PImage swtchOn;
PImage swtchOff;
PImage resist1;
PImage resist2;
PImage resist3;
PImage ledB;
PImage ledP;
PImage ledR;
PImage ledG;

PImage charge;
PImage battery1;
PImage battery2;
PImage convert; 
PImage fuse;

String s;
String str;

Table table;
String tab;
String tab2;

float widthHalf;
float heightHalf;

HashMap<String, Integer> hm = new HashMap<String, Integer>();

void setup()
{
  size(1200, 800);
  //size(1728, 972);
  rectMode(CENTER);
  imageMode(CENTER);
  noCursor();

  frame.setResizable(true);
  widthHalf = width / 2;
  heightHalf = height / 2;

  /*
  hm.put("Ava", 1);
   
   for (Map.Entry me : hm.entrySet()) {
   print(me.getKey() + " is ");
   println(me.getValue());
   }
   
   
   // We can also access values by their key
   int val = hm.get("Casey");
   println("Casey is " + val);
   
   */
  minim = new Minim(this);
  pl_1 = minim.loadFile("Music1Loopable.mp3");

  pl_1.loop();


  circuit1 = loadImage("Circuit_1_StartingPoint.png");
  circuit2 = loadImage("Circuit_2Start.png");


  volt = loadImage("10 kOhm.png");
  resist = loadImage("Battery_6_Volt.png");
  //background2 = loadImage("Jellyfish.jpg");

  checkNon = loadImage("Button_Check_Box_Empty.png");
  checkPos = loadImage("Button_Check_Box_Check.png");
  checkNeg = loadImage("Button_Check_Box_X.png");

  home = loadImage("Button_Home.png");
  reset = loadImage("Button_Reset.png");
  speech = loadImage("Button_Speech_Bubble.png");

  speechL = loadImage("Speech_Bubble_XLarge.png");
  speechS = loadImage("Speech_Bubble_Small.png");
  arrow = loadImage("Precision_Arrow.png");

  genBtn = loadImage("Button_Generic.png");

  mouseD = loadImage("Hand_MouseDown.png");
  mouseG = loadImage("Hand_Grab.png");
  mouseN = loadImage("Hand_Default.png");


  arrowBtn = loadImage("Button_Arrow_Left.png");

  swtchOn = loadImage("Switch_01.png");
  swtchOff = loadImage("Switch_02.png");
  resist1 = loadImage("2 kOhm.png");
  resist2 = loadImage("5 kOhm.png");
  resist3 = loadImage("10 kOhm.png");
  ledB = loadImage("light_blue_off.png");
  //ledP = loadImage("Hand_Default.png");
  ledR = loadImage("light_red_off.png");
  ledG = loadImage("light_green_off.png");

  charge = loadImage("charge_controller.png");
  battery1 = loadImage("Batter_20_Volt.png");
  battery2 = loadImage("Battery_12_Volt.png");
  convert = loadImage("DC to AC.png");
  fuse = loadImage("fuse.png");
  //audioList = loadStrings("info.txt");
  //s = audioList[0];

  //str = split(s, ',');


  table = loadTable("info.csv", "header");
  //tab = table.getString(0,0);
  tab2 = table.getString(0, 1);


  for (int i = 0; i < table.getRowCount (); i++)
  {
    if (tab == null)
    {
      tab =  table.getString(i, 1);
    } else
    {
      tab +=  table.getString(i, 1);
    }
  }

  SwitchToTitle();

  // to get all of the values simply loop through (i,0);
}

void draw()
{



  background(0);

  text(gamePath, width - 100, heightHalf);

  fill(122, 2, 2);
  //text(tab, 400, 40);
  //text(tab2, 600,40);

  if (gstitle != null)
  {
    gstitle.Draw();

    if (gstitle != null)
    {
      gstitle.Update();
    }
  }


  if (gsplay != null)
  {
    gsplay.Draw();

    if (gsResult == null)
    {
      gsplay.Update();
    }
  }

  if (gsCareer != null)
  {
    gsCareer.Draw();

    if (gsResult == null)
    {
      gsCareer.Update();
    }
  }

  if (gsResult != null)
  {
    gsResult.Draw();
    gsResult.Update();

    if (gsResult.done)
    {
      gsResult = null;
    }
  }



  if (!mousePressed)
  {
    tint(255, 255, 255, 255);
    pushMatrix();
    translate(mouseX + 8, mouseY + 18);
    scale(.05);
    image(mouseN, 0, 0);
    popMatrix();
  } else
  {
    tint(255, 255, 255, 255);
    pushMatrix();
    translate(mouseX + 8, mouseY + 18);
    scale(.05);
    image(mouseG, 0, 0);
    popMatrix();
  }
}

void SwitchToTitle()
{
  gstitle = new GSTitle();
  gsplay = null;
  gsCareer = null;
}

void SwitchToCareer()
{
  gsCareer = new GSCareerSelect();
  gstitle = null;
  gsplay = null;
}


void SwitchToPlay()
{
  gsCareer = null;
  gsplay = new GSPlay();
  gstitle = null;
}

void SwitchToResult()
{
  gsResult = new GSResult();
}

