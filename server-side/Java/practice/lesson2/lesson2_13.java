class Main {
  public static void main(String[] args) {
    String[] names = {"犬", "羊", "子犬"};
    
    // for文を用いて、「私の名前は◯◯です」と出力してください
    for (int i = 0; names.length > i; i++ ) {
      System.out.println("私の名前は" + names[i] + "です" ); 
    }
    
  }
}