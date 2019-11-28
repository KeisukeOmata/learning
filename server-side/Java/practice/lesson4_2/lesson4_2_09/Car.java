class Car {
  private String name;
  private String color;
  private int distance = 0;
  private int fuel = 100;

  Car(String name, String color) {
    this.name = name;
    this.color = color;
  }

  public String getName() {
    return this.name;
  }

  public String getColor() {
    return this.color;
  }

  public int getDistance() {
    return this.distance;
  }

  public int getFuel() {
    return this.fuel;
  }

  public void setDistance(int distance) {
    this.distance = distance;
  }

  public void setFuel(int fuel) {
    this.fuel = fuel;
  }

  public void printData() {
    System.out.println("名前：" + this.getName());
    System.out.println("色：" + this.getColor());
    System.out.println("走行距離：" + this.getDistance() + "km");
    System.out.println("ガソリン量：" + this.getFuel() + "L");
  }

  public void run(int distance) {
    System.out.println(distance + "km走ります");
    if (distance <= this.getFuel()) {
      int f = this.getFuel() - distance;
      setFuel(f);
      distance += this.distance;
      setDistance(distance);
    } else {
      System.out.println("ガソリンが足りません");
    }
    System.out.println("走行距離：" + this.getDistance() + "km");
    System.out.println("ガソリン量：" + this.getFuel() + "L");
  }
}