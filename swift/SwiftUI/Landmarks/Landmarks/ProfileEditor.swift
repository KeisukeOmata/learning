import SwiftUI

struct ProfileEditor: View {
    //@Binding => View間で双方向のデータ共有を行う
    @Binding var profile: Profile
    
    //Goal Dateに設定するデータのレンジを設定する
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                //VStack内では横線、HStack内では縦線を表示する
                Divider()
                //@Bindingの変数なので$profileとなる
                TextField("Username", text: $profile.username)
            }
            
            //通知のOn,OFFを変えるトグル
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            //Seasonal Photoを変えるPicker
            //alignmentは表示位置
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                //Pickerに表示するアイコンを設定する
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases, id: \.self) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                //Pickerのスタイルを決める
                .pickerStyle(SegmentedPickerStyle())
            }
            //距離を開ける
            .padding(.top)
            
            //Goal Dateを設定するDatePicker
            VStack(alignment: .leading, spacing: 20) {
                Text("Goal Date").bold()
                DatePicker(
                    "Goal Date",
                    selection: $profile.goalDate,
                    in: dateRange,
                    displayedComponents: .date)
            }
            .padding(.top)
        }
    }
}

//プレビュー
struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
