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

boolean paused = false;

/////////////////////////////////////////////////////////////////////////////////////////////

String audioList[];

// can make into an array
PImage background1;
PImage background2;

PImage volt;
PImage resist;

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
  rectMode(CENTER);
  imageMode(CENTER);
  
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
  
  //pl_1.loop();
  
  
  background1 = loadImage("Circuit_Simple_Example.png");
  
  volt = loadImage("10 kOhm.png");
  resist = loadImage("Battery_6_Volt.png");
  background2 = loadImage("Jellyfish.jpg");

  SwitchToTitle();

  audioList = loadStrings("info.txt");
  s = audioList[0];

  //str = split(s, ',');


  table = loadTable("info.csv", "header");
  //tab = table.getString(0,0);
  tab2 = table.getString(0, 1);


  for (int i = 0; i < table.getRowCount(); i++)
  {
    if (tab == null)
    {
      tab =  table.getString(i, 1);
    }
    else
    {
      tab +=  table.getString(i, 1);
    }
  }

  // to get all of the values simply loop through (i,0);
}

void draw()
{
  background(0);

  fill(122, 2, 2);
  //text(tab, 400, 40);
  //text(tab2, 600,40);

  if (gstitle != null)
  {
    gstitle.Update();

    if (gstitle != null)
    {
      gstitle.Draw();
    }
  }


  if (gsplay != null)
  {
    gsplay.Update();

    if (gsplay != null)
    {
      gsplay.Draw();
    }
  }



  // get txt file loaded
  //


  /*
  for(int i = 0; i < audioList.length - 1; i++)
   {
   
   soemString = new Float(audioList[i]);
   }
   */

  // print backgorund image
  //image(bg, 0, 0);
}

void SwitchToTitle()
{
  gstitle = new GSTitle();
  gsplay = null;
}

void SwitchToPlay()
{
  gsplay = new GSPlay();
  gstitle = null;
}
