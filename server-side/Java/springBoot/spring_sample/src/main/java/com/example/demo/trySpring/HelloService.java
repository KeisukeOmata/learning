package com.example.demo.trySpring;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

// サービスクラスには@Serviceアノテーションを付ける
@Service
public class HelloService {

  // @Autowiredでインスタンスを取得
  @Autowired
  private HelloRepository helloRepository;

  public Employee findOne(int id) {

    // 1件検索実行
    Map<String, Object> map = helloRepository.findOne(id);

    // Mapから値を取得
    int employeeID = (Integer) map.get("employee_id");
    String employeeName = (String) map.get("employee_name");
    int age = (Integer) map.get("age");

    Employee employee = new Employee();

    employee.setEmployeeID(empleyeeID);
    empleyee.setEmpleyeeName(empleyeeName);
    empleyee.setAge(age);

    return empleyee;
  
  }
  
}