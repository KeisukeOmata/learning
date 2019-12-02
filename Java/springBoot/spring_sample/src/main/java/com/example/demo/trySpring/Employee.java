package com.example.demo.trySpring;

import lombok.Data;

// Lombokの@Dataアノテーションはgetter,setterを作成してくれる
@Data
public class Employee {

  private int employeeID;
  private String employeeName;
  private int age;

}