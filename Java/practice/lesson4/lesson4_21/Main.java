class Main {
  public static void main(String[] args) {
    Person person1 = new Person("omata", "keisuke", 27, 1.6, 50.0, "doctor");
    person1.printData();
    Person person2 = new Person("hoge", "hoge", "hoge", 65, 1.75, 80.0, "OfficeWorker");
    person2.printData();
    person1.setMiddleName("hoge"); 
    person1.setJob("officeWorker");
    System.out.println("person1の仕事を" + person1.getJob() + "に変更しました");
    person1.printData();
  }
}
