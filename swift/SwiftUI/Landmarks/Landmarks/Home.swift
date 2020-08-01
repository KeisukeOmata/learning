import SwiftUI

struct CategoryHome: View {
    //Landmarkクラスを辞書型で作成
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarkData,
            by: { $0.category.rawValue }
        )
    }
    
    //特集をLandmarkクラスで作成
    var featured: [Landmark] {
        landmarkData.filter { $0.isFeatured }
    }
    
    //状態管理を行う
    @EnvironmentObject var userData: UserData
    //状態管理を行う
    //ユーザー情報を表示する
    @State var showingProfile = false
    //ユーザー情報を表示するボタン
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            //システムイメージ
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        //他のviewに遷移させる
        NavigationView {
            List {
                //特集の表示
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    //フレームサイズでViewを切り取り、はみ出した部分が非表示になる
                    .clipped()
                    //画面いっぱいまで表示
                    .listRowInsets(EdgeInsets())
                //Landmarkクラスが持つcategoriesをtextで表示
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    //CategoryRow.swift
                    //keyはカテゴリー名
                    //categoriesは辞書型なので、カテゴリー名に紐づくLandmarkがitemsとして渡される
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                //画面いっぱいまで表示
                .listRowInsets(EdgeInsets())
                //LandmarkList.swiftへ遷移
                NavigationLink(destination: LandmarkList()) {
                    Text("See All")
                }
            }
            //ナビゲーションバータイトル
            .navigationBarTitle(Text("Featured"))
            //ナビゲーションバーアイテム
            .navigationBarItems(trailing: profileButton)
            //モーダルでユーザー情報を表示する
            .sheet(isPresented: $showingProfile) {
                //ProfileHost.swift
                ProfileHost()
                    .environmentObject(self.userData)
            }
        }
    }
}

//特集の表示
struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        //渡された最初の画像を表示
        landmarks[0].image.resizable()
    }
}

//プレビュー
struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(UserData())
    }
}
