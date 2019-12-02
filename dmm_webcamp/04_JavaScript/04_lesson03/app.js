// var orange = 100;
// var apple = 120;
// if(orange < apple){
//     alert("");
// }else if(orange == apple){
//     alert("");
// }else{
//     alert("");
// }

// 2を掛け続けて" + max + "を超えるのに必要だった回数は" + count + "回です");
// 1から10まで足し算した結果は" + num + "です");



// var max = 100;
// var count = 0;
// var num = 1;
// while(num < 100){
//     count = count + 1;
//     num = num * 2;
// }
// alert("")


// var i;
// var num = 0;
// for(i = 1; i < 11; i++1){
//     num = num + i;
// }
// alert("")


var user_hand = prompt("gu-chokipa-");
while((user_hand != "gu-")&&(user_hand != "choki")&&(user_hand != "pa-")&&(user_hand != null)){
    alert("mouikkai")
    user_hand = ptompt("gu-chokipa-")
}

var js_hand = js_hand_create();

var answer = winLose(user_hand, js_hand);

if(user_hand != null){
    alert("you" + user_hand + "js" + js_hand + "answer" + answer);
}else{
    alert("byby")
}

function js_hand_create(){
    var hand;
    var js_hand_number = Math.floor(Math.random() * 3);
    if(js_hand_number == 0){
        hand = "gu-";
    }else if(js_hand_number == 1){
        hand = "choki";
    }else{
        hand = "pa-";
    }return hand;
}

function winLose(user, js){
    var ansert;
    if(user = "gu-"){
        if(js = "gu-"){
            ansert = "aiko";
        }else if(js = "choki"){
            ansert = "kachi";
        }else{
            ansert = "make";
        }
    }else if(user = "choki"){
        if(js = "gu-"){
            ansert = "make";
        }else if(js = "choki"){
            ansert = "aiko";
        }else{
            ansert = "kachi";
        }
    }else{
        if(js = "gu-"){
            ansert = "kachi";
        }else if(js = "choki"){
            ansert = "make";
        }else{
            ansert = "aiko";
        }
    }return ansert;
}

