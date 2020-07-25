import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //通知を送る時間
    let hours = 12
    //通知を送る分
    let minute = 12
    //通知許可フラグ
    var notificationPermissionFlg = true
    //初回フラグ
    var firstFlg = true
    //通知に使うtitle
    var notificationTitleString: String = "19時になりました"
    //通知に使うbody
    var notificationBodyString: String = "動画が更新されました"

    //アラートの設定を行う
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //アラートを表示する
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (permission, error) in
            //通知の許可についてtrueかfalseが入る
            self.notificationPermissionFlg = permission
            //もしerrorに値が入っていれば
            if let error = error {
                print("エラーです")
            }
        }
        //初回フラグにfalseを設定する => 初回のみ聞く処理を判定
        firstFlg = false
        //時間起動の通知
        timeNotification()
        return true
    }
    
    //時間起動の通知
    func timeNotification() {
        //UNMutableNotificationContent型のインスタンス
        let content = UNMutableNotificationContent()
        //DateComponents型のインスタンス
        var timeDateComponents = DateComponents()
        //UNNotificationTrigger型
        var trgUNNotificationTrigger: UNNotificationTrigger
       
        //contentには通知に使う文章や音楽を設定できる
        content.title = notificationTitleString
        content.body = notificationBodyString
        content.sound = .default
        //DateComponentsに時間と分を設定
        timeDateComponents.hour = hours
        timeDateComponents.minute = minute
        //UNNotificationTriggerにUNCalendarNotificationTriggerで時間を設定
        //repeatsは繰り返し要否 => 毎日同時刻に通知を行う
        trgUNNotificationTrigger = UNCalendarNotificationTrigger(dateMatching: timeDateComponents, repeats: true)
        
        //通知のスタイルを決定する
        let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trgUNNotificationTrigger)
        //通知を設定する
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    //バックグラウンドで通知を呼ぶ
    func applicationDidEnterBackground(_ application: UIApplication) {
        timeNotification()
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

}

