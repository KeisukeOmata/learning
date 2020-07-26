import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            //クロージャーでLandmarkRowにjsonを全て渡す
            //LandmarkクラスにIdentifiableプロトコルを付与することでidの記載が不要になる
            //List(landmarkData, id: \.id) { landmark in
            List(landmarkData) { landmark in
                //LandmarkDetail.swiftへ遷移
                //LandmarkDetailの引数landmarkにクロージャーで渡されたlandmark(json)を渡す
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    //LandmarkRow.swift
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

//プレビュー画面
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        //プレビューを機種毎に表示する
        ForEach(["iPad Pro (12.9-inch)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
