import SwiftUI

struct LandmarkRow: View {
    //Landmarkモデル
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                //リサイズを有効にする
                .resizable()
                //画像の大きさ
                .frame(width: 50, height: 50)
            Text(landmark.name)
            //間隔を開ける
            Spacer()
        }
    }
}

//プレビュー画面
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //Landmarkモデルにjsonの1つ目を渡す
            LandmarkRow(landmark: landmarkData[0])
            //Landmarkモデルにjsonの2つ目を渡す
            LandmarkRow(landmark: landmarkData[1])
        }
        //プレビューのサイズを変更する
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
