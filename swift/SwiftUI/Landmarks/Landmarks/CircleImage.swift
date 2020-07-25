import SwiftUI

struct CircleImage: View {
    var body: some View {
        //画像の名前
        Image("turtlerock")
            //円形
            .clipShape(Circle())
            //縁取り
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            //影
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
