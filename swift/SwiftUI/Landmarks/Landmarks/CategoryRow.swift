import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    //Landmarkクラス
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            //カテゴリー名を表示
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            //スクロールビュー
            //.verticalで縦方向にスクロール
            //.horizontalで横方向にスクロール
            //showsIndicatorsで下部にインジケータを表示
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    //itemsにはLandmarkクラスが入ってる
                    ForEach(self.items) { landmark in
                        //LandmarkDetail.swiftへ画面遷移
                        NavigationLink(
                            destination: LandmarkDetail(
                                landmark: landmark
                            )
                        ) {
                            //画面表示を以下で作成する
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

//画面表示
struct CategoryItem: View {
    var landmark: Landmark
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                //リンクの色が付くの防止
                .renderingMode(.original)
                //サイズの変更を許可
                .resizable()
                //画像の大きさ
                .frame(width: 155, height: 155)
                //角を丸くする
                .cornerRadius(5)
            Text(landmark.name)
                //リンクの色が付くの防止
                .foregroundColor(.primary)
                .font(.caption)
        }
        //画像同士の距離
        .padding(.leading, 15)
    }
}

//プレビュー
struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: landmarkData[0].category.rawValue,
            items: Array(landmarkData.prefix(4))
        )
        .environmentObject(UserData())
    }
}
