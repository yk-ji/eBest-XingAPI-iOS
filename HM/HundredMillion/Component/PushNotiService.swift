//
//  PushService.swift
//  HundredMillion
//
//  Created by youngkwanji on 2021/02/02.
//  Copyright © 2021 youngkwanji. All rights reserved.
//

import Foundation
import UserNotifications

class PushNotiService : NSObject{
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    override init() {
        super.init()
        
        let options = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        userNotificationCenter.requestAuthorization(options: options) { success, error in
            if let error = error {
                print(error)
            }
        }
    }
    
    func showNotification(title: String, body: String){
        let notiContent = UNMutableNotificationContent()
        
        notiContent.title = title
        notiContent.body = body
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats:false)
        let request = UNNotificationRequest(identifier: "showNotification", content: notiContent, trigger: trigger)
        
        userNotificationCenter.add(request) { error in
            if let error = error {
                print(error)
            }
        }
    }  
}
