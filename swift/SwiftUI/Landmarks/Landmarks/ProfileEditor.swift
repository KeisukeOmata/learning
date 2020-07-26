import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                //VStack内では横線、HStack内では縦線を表示します。
                Divider()
                TextField("Username", text: $profile.username)
            }
        }
    }
}

//プレビュー
struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
