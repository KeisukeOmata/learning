class Main {
  public static void main(String[] args) {
    Person person1 = new Person("omata", "keisuke", 27, 1.6, 50.0);
    person1.printData();
    Person person2 = new Person("hoge", "hoge", "hoge", 65, 1.75, 80.0);
    person2.printData();
    System.out.println("合計" + Person.count + "人です");
    Person.printCount();
    System.out.println("person2のミドルネームは" + person2.getMiddleName() + "です");
  }
}
