import SwiftUI

struct LandmarkList: View {
    //@State => プロパティが更新された場合に、参照しているViewも同時に更新される
    //@State var showFavoritesOnly = false
    //クラスで状態管理を行う場合
    @EnvironmentObject var userData: UserData

    var body: some View {
        NavigationView {
            List {
                //トグルを表示し、showFavoritesOnlyのtrue, falseを切り替える
                //@Stateで宣言した変数にアクセスするには$を付ける
                //Toggle(isOn: $showFavoritesOnly) {
                //クラスで状態管理を行う場合
                //@Publishedで宣言した変数にアクセスするには$を付ける
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                //クロージャーでLandmarkRowにjsonを全て渡す
                //LandmarkクラスにIdentifiableプロトコルを付与することでidの記載が不要になる
                //List(landmarkData, id: \.id) { landmark in
                //ForEach(landmarkData) { landmark in
                //クラスで状態管理を行う場合
                //landmarksはjson全部
                ForEach(userData.landmarks) { landmark in
                    //showFavoritesOnlyがfalseの場合、ForEachで回したものが全て通る
                    //showFavoritesOnlyがtrueの場合、landmark.isFavoriteがtrueのものだけ通る
                    //if !self.showFavoritesOnly || landmark.isFavorite {
                    //クラスで状態管理を行う場合
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        //LandmarkDetail.swiftへ遷移
                        //LandmarkDetailの引数landmarkにクロージャーで渡されたlandmark(json)を渡す
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            //LandmarkRow.swift
                            LandmarkRow(landmark: landmark)
                        }
                    }
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
                .environmentObject(UserData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
