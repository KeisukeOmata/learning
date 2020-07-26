import SwiftUI
import Combine

//Combine framework
//ObservableObject => クラスに状態変数を集めて状態管理を行う
//変数宣言時に@Publishedを付ける
final class UserData: ObservableObject  {
    //お気に入りのみ表示のOn Off
    @Published var showFavoritesOnly = false
    //landmarkDataはjson全部
    @Published var landmarks = landmarkData
    //プロフィール
    @Published var profile = Profile.default
}
