class Car {
  private String name;
  private String color;
  private int distance = 0;

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

  public void setDistance(int distance) {
    this.distance = distance;
  }

  public void printData() {
    System.out.println("名前：" + this.getName());
    System.out.println("色：" + this.getColor());
    System.out.println("走行距離：" + this.getDistance() + "km");
  }

  public void run(int distance) {
    System.out.println(distance + "km走ります");
    distance += this.distance;
    setDistance(distance);
    System.out.println("走行距離：" + this.getDistance() + "km");
  }
}