import java.util.Scanner;            

class Main {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);                                        
    Car car = new Car("フェラーリ", "赤");
    Bicycle bicycle = new Bicycle("ビアンキ", "緑");
    Person person1 = new Person("omata", "keisuke", 27, 1.6, 50.0);            
    Person person2 = new Person("hoge", "hoge", "hoge", 65, 1.75, 80.0);

    System.out.println("【車の情報】");
    car.printData();
    car.setOwner(person1);
    person1.buy(car);
    car.getOwner().printData();
    System.out.println("-----------------");
    System.out.print("走る距離を入力してください：");
    int carDistance = scanner.nextInt();
    car.run(carDistance);

    System.out.println("-----------------");
    System.out.print("給油する量を入力してください：");
    int litre = scanner.nextInt();
    car.charge(litre);

    System.out.println("=================");
    System.out.println("【自転車の情報】");
    bicycle.printData();
    bicycle.setOwner(person2);
    person2.buy(bicycle);
    bicycle.getOwner().printData();
    System.out.println("-----------------");
    System.out.print("走る距離を入力してください：");
    int bicycleDistance = scanner.nextInt();
    bicycle.run(bicycleDistance);
  }
}