//
//  AppDelegate.swift
//  DDD.Attendance
//
//  Created by ParkSungJoon on 01/09/2019.
//  Copyright © 2019 DDD. All rights reserved.
//

import UIKit
import Firebase
import FirebaseMessaging

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        Messaging.messaging().delegate = self
        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions,completionHandler: {_, _ in })
        application.registerForRemoteNotifications()
        signOutIfNeeded()
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("\(#function)")
    }
}

extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        guard let token = fcmToken else { return }
        print("Firebase registration token: \(token)")
        let dataDict:[String: String] = ["token": token]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
    }
}
private extension AppDelegate {
    func signOutIfNeeded() {
        let userDefault = UserDefaults.standard
        if userDefault.value(forKey: "wasOpendApp") == nil {
            userDefault.set(true, forKey: "wasOpendApp")
            Firebase().signOut { isSuccess in
                if isSuccess {
                    print("Success - Unauthenticate Firebase")
                } else {
                    print("Failure - Unauthenticate Firebase")
                }
            }
        }
    }
}
