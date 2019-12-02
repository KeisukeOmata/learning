class Bicycle {
  private String name;
  private String color;

  Bicycle(String name, String color) {
    this.name = name;
    this.color = color;
  }

  public String getName() {
    return this.name;
  }

  public String getColor() {
    return this.color;
  }

  public void printData() {
    System.out.println("名前：" + this.getName());
    System.out.println("色：" + this.getColor());
  }
} 