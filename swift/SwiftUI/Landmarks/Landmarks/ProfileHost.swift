import SwiftUI

struct ProfileHost: View {
    //状態管理
    //Profileクラスのデフォルトを設定する
    @State var draftProfile = Profile.default
    //編集モード
    @Environment(\.editMode) var mode
    //状態管理するUserDataクラス
    @EnvironmentObject var userData: UserData

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            //編集ボタン
            HStack {
                Spacer()
                
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: userData.profile)
            } else {
                //ProfileEditor.swift
                ProfileEditor(profile: $draftProfile)
            }
            //ProfileSummary.swift
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

//プレビュー
struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(UserData())
    }
}
