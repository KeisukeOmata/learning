var user_hand = prompt("gu-chokipa-");
while((user_hand != "gu-")&&(user_hand != "choki")&&(user_hand != pa-)&&(user_hand != null)){
    alert("gu-chokipa-");
    user_hand = prompt("gu-chokipa-");
}

var js_hand = js_hand_create();

var judge = winLose(user_hand, js_hand);

alert("you" + user_hand + "js" + js_hand + "kekkaha" + judge);


function js_hand_create(){
    var hand;
    var js_hand_num = Math.floor(Math.random() * 3);
    if(js_hand_num == 0){
        hand = "gu-";
    }else if(js_hand_num == 1){
        hand = "choki";
    }else{
        hand = "pa-";
    }
    return hand;
}

function winLose(user, js){
    var winLoseStr;
    if(user == "gu-"){
        if(js == "gu-"){
            winLoseStr = "aiko";
        }else if(js == "choki"){
            winLoseStr = "kachi";
        }else{
            winLoseStr = "make";
        }
    }else if(user == "choki"){
        if(js == "gu-"){
            winLoseStr = "make";
        }else if(js == "choki"){
            winLoseStr = "aiko";
        }else{
            winLoseStr = "kachi";
        }
    }else{
        if(js == "gu-"){
            winLoseStr = "kachi";
        }else if(js == "choki"){
            winLoseStr = "kachi ";
        }else{
            winLoseStr = "make";
        }
    }
return winLoseStr;
}