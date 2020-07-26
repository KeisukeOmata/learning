import SwiftUI

struct LandmarkDetail: View {
    //クラスで状態管理を行う
    @EnvironmentObject var userData: UserData
    //引数にlandmarkを取る
    var landmark: Landmark
    //jsonの配列の添え字
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        VStack {
            //MapView.swift
            //引数coordinateに自身の引数landmarkのlocationCoordinateを渡す
            MapView(coordinate: landmark.locationCoordinate)
                //heightのみ設定するとwidthは自動で決まる
                .frame(height: 300)
                //Mapをノッチの部分まで拡張
                .edgesIgnoringSafeArea(.top)
            
            //CircleImage.swift
            //引数imageに自身の引数landmarkのimageを渡す
            CircleImage(image: landmark.image)
                //y軸方向にずらす
                .offset(y: -130)
                .padding(.bottom, -130)
            
            //垂直方向
            VStack(alignment: .leading) {
                //水平方向
                HStack {
                    //ランドマークの名前
                    Text(landmark.name)
                        .font(.title)
                    //お気に入りボタン
                    Button(action: {
                        //トグルでisFavoriteのtrue, falseを切り替えられる
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }) {
                        //isFavoriteがtrueのとき
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                            //システムイメージで星を表示する
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        //isFavoriteがfalseのとき
                        } else {
                            //システムイメージでグレーアウトした星を表示する
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                //水平方向
                HStack {
                    //ランドマークがある場所の名前
                    Text(landmark.park)
                        .font(.subheadline)
                    //間隔を開ける(HStack内なので水平方向)
                    Spacer()
                    //所在地
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            //余白
            .padding()
            //間隔を開ける(VStack内なので垂直)
            Spacer()
        }
        //ナビゲーションバーのタイトルを設定する
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

//プレビュー画面
struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        //引数landmarkにjsonの1つ目を渡す
        LandmarkDetail(landmark: landmarkData[0])
            .environmentObject(UserData())
    }
}
