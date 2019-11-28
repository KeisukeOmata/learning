package com.example.demo.trySpring;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

// コントローラークラスには＠Controllerアノテーションを付ける
@Controller
public class HelloController {

  // GETメソッドで呼ばれる
  @GetMapping("/hello")
  public String getHello() {
    return "hello";
  }
  
  // POSTメソッドで呼ばれる
  @PostMapping("/hello")
  // @RequestParamアノテーションでhtmlからの入力を受け取る
  // @RequestParamの引数はhtmlのname属性
  public String postRequest(@RequestParam("text1") String str, Model model) {
    // model.addAttributeにキーとバリューをセットすることで、htmlからキーのバリューが受け取れる
    model.addAttribute("sample", str);
    return "helloResponse";
  }

}
