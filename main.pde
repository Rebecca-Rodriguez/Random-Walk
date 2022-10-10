import controlP5.*;

ControlP5 cp5;

Button startButton;
Toggle colorToggle, gradualToggle;
Slider iterationsSlider, stepsSlider;

// Variables
Walker rw = new Walker();
int iterations = 1000;
int steps = 1;
int currentColor = 0;
int counter = 0;

boolean gameOn = false;
boolean toggleColor = false;
boolean toggleGradual = false;
boolean needReset = true;

void setup()
{
  size(800, 800);
  reset();

  cp5 = new ControlP5(this);

  // Buttons
  startButton = cp5.addButton("gameOn")
    .setPosition(20, 20)
    .setSize(90, 30);
  startButton.getCaptionLabel().setText("START").setSize(20);

  // Toggles
  colorToggle = cp5.addToggle("toggleColor")
    .setPosition(130, 20)
    .setSize(50, 20);
  colorToggle.getCaptionLabel().setText("COLOR").setSize(10);

  gradualToggle = cp5.addToggle("toggleGradual")
    .setPosition(190, 20)
    .setSize(50, 20);
  gradualToggle.getCaptionLabel().setText("GRADUAL").setSize(10);

  // Sliders
  iterationsSlider = cp5.addSlider("iterations", 1000, 500000)
    .setPosition(260, 20)
    .setSize(300, 30);
  iterationsSlider.getCaptionLabel().setText("ITERATIONS").setSize(15);
  iterationsSlider.getValueLabel().setSize(15);

  stepsSlider = cp5.addSlider("steps", 1, 1000)
    .setPosition(260, 50)
    .setSize(300, 30);
  stepsSlider.getCaptionLabel().setText("STEP COUNT").setSize(15);
  stepsSlider.getValueLabel().setSize(15);
}

void reset()
{
  background(141, 170, 210);
}

void gameOn()
{
  gameOn = true;
  if (needReset)
  {
    reset();
    rw.reset();
    counter = 0;
    needReset = false;
  }
}

void draw()
{
  if (gameOn)
  {
    if (!toggleGradual)
    {
      gameOn();
      for (int i = 0; i < iterations; i++)
      {
        if (toggleColor)
        {
          currentColor = int(map(i, 0, iterations, 0, 255));
        } else
        {
          currentColor = 0;
        }
        stroke(currentColor);
        rw.step();
        rw.Draw();
      }
      gameOn = false;
      needReset = true;
    }
    if (toggleGradual)
    {
      for (int i = 0; i < steps; i++)
      {
        if (toggleColor)
        {
          currentColor = int(map(counter, 0, iterations, 0, 255));
        } else
        {
          currentColor = 0;
        }
        stroke(currentColor);
        rw.step();
        rw.Draw();
        counter++;
        if (counter >= iterations)
        {
          gameOn = false;
          needReset = true;
        }
      }
    }
  }
}
