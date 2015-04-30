class Material
{
  
  int durability;
  int tempMax;
  float weight;
  
  boolean pass1 = false;
  boolean pass2 = false;
  boolean pass3 = false;
  
  int id;
  
  Material(int durability, int temp, float weight, int id)
  {
    this.durability = durability;
    this.tempMax = temp;
    this.weight = weight;
    this.id = id;
  }
}
