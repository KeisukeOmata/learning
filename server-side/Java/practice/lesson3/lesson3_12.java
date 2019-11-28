import java.util.Scanner;

class Main {
  public static void main (String[] args) {
    Scanner scanner = new Scanner(System.in);    
    System.out.print("名前： ");
    String name = scanner.next();
    System.out.println("こんにちは" + name + "さん");
  }
}