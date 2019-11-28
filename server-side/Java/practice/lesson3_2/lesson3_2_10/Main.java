import java.util.Scanner;

class Main {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    System.out.print("何人分の情報を入力しますか：");
    int number = scanner.nextInt();
    int maxAge = 0;
    int totalAge = 0;
    for (int i = 1; i <= number; i++) {
      System.out.print(i + "人目");
      System.out.print("名前：");
      String firstName = scanner.next();
      System.out.print("名字：");
      String lastName = scanner.next();
      System.out.print("年齢：");
      int age = scanner.nextInt();
      System.out.print("身長(m)：");
      double height = scanner.nextDouble();
      System.out.print("体重(kg)：");
      double weight = scanner.nextDouble();
      Person.printData(firstName, lastName, age, height, weight);
      if (maxAge <= age) {
        maxAge = age;
      }
      totalAge += age;
    }
    System.out.println("最高年齢は" + maxAge + "歳です");
    int averageAge = totalAge / number;
    System.out.print("平均年齢は" + averageAge + "歳です");
  }
}
