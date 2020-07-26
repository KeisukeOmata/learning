import SwiftUI

struct CircleImage: View {
    //引数にimageを取る
    var image: Image
    
    var body: some View {
        image
            //円形
            .clipShape(Circle())
            //縁取り
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            //影
            .shadow(radius: 10)
    }
}

//プレビュー画面
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        //引数imageに画像の名前を渡す
        CircleImage(image: Image("turtlerock"))
    }
}
