class Main {
  public static void main(String[] args) {
    // 渡す引数のデータ型は指定しなくてOK
    String name = fullName("omata", "keisuke");
    printData(name, 27);
    printData("hoge", 65);
  }

  public static void printData(String name, int age) {
    System.out.println("私の名前は" + name + "です");
    System.out.println("年齢は" + age + "歳です");
  }

  public static String fullName(String firstName, String lastName) {
    return firstName + " " + lastName;
  }
  
}
