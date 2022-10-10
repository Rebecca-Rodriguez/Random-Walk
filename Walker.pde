class Walker
{
  float x;
  float y;

  Walker()
  {
    reset();
  }

  void reset()
  {
    // Starting point in the middle of the screen
    x = width/2;
    y = height/2;
  }

  void step()
  {
    // Set direction of lines
    int rand = (int)random(0, 4);
    int pixel = 1;

    if (rand == 0)
    {
      y += pixel;
    } else if (rand == 1)
    {
      y-= pixel;
    } else if (rand == 2)
    {
      x -= pixel;
    } else if (rand == 3)
    {
      x += pixel;
    }

    // Make sure does not go off the edges
    if (x < 0)
      x = 0;
    if (x > width)
      x = width;
    if (y < 0)
      y = 0;
    if (y > height)
      y = height;
  }

  void Draw()
  {
    point(x, y);
  }
}
