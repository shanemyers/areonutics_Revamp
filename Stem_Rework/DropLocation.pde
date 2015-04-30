class DropLocation
{
  int typeAccept;
  PVector pos;
  boolean hasObject = false;
  int id;
  int holdingType = -1;
  boolean active = true;
  
  DropLocation(int type, PVector pos, int id)
  {
    this.id = id;
    this.typeAccept = type;
    this.pos = pos;
  }
}
