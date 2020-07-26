import Foundation

//プロフィールクラス
struct Profile {
    var username: String
    var prefersNotifications: Bool
    //Seasonはenum
    var seasonalPhoto: Season
    var goalDate: Date
    
    //デフォルト値
    static let `default` = Self(username: "g_kumar", prefersNotifications: true, seasonalPhoto: .winter)
    
    //初期化
    init(username: String, prefersNotifications: Bool = true, seasonalPhoto: Season = .winter) {
        self.username = username
        self.prefersNotifications = prefersNotifications
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = Date()
    }
    
    enum Season: String, CaseIterable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
}
