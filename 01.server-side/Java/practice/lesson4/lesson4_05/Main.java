class Main {
  public static void main(String[] args) {
    Person person1 = new Person();
    person1.hello();
    person1.name = "omata";
    System.out.println(person1.name);

    Person person2 = new Person();
    person2.hello();
    person2.name = "keisuke";
    System.out.println(person2.name);
  }
}