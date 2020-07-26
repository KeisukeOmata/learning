import SwiftUI

struct LandmarkDetail: View {
    var body: some View {
        VStack {
            //MapView.swift
            MapView()
                //heightのみ設定するとwidthは自動で決まる
                .frame(height: 300)
                //Mapをノッチの部分まで拡張
                .edgesIgnoringSafeArea(.top)
            
            //CircleImage.swift
            CircleImage()
                //y軸方向にずらす
                .offset(y: -130)
                .padding(.bottom, -130)
            
            //垂直方向
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                //水平方向
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    //間隔を開ける(HStack内なので水平方向)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
            //余白
            .padding()
            //間隔を開ける(VStack内なので垂直)
            Spacer()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail()
    }
}
