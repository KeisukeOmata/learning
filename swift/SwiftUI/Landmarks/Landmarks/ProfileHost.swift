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
            HStack {
                //キャンセルボタン
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.draftProfile = self.userData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                //間隔を開ける
                Spacer()
                //編集ボタン
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: userData.profile)
            } else {
                //ProfileEditor.swift
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        self.draftProfile = self.userData.profile
                    }
                    .onDisappear {
                        self.userData.profile = self.draftProfile
                    }
            }
            //ProfileSummary.swift
            //ProfileSummary(profile: draftProfile)
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
