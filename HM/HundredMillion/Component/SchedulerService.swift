//
//  SchedulerService.swift
//  HundredMillion
//
//  Created by youngkwanji on 2021/01/29.
//  Copyright © 2021 youngkwanji. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class SchedulerService : NSObject{
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    func initSchedule(){
        let pushService = PushNotiService.init()
        userNotificationCenter.delegate = AppDelegate.shared()
        setSchedule(timeString: SCHED_TIME_CD.AUTO_START_TIME)
        setSchedule(timeString: SCHED_TIME_CD.AUTO_STOP_TIME)
        setSchedule(timeString: SCHED_TIME_CD.CONVERT_CSV_TIME)
        setSchedule(timeString: SCHED_TIME_CD.DRIVE_UPLOAD_TIME)
    }
    
    func setSchedule(timeString: String) {
        let notiContent = UNMutableNotificationContent()
        
        var title = "";
        let body = timeString;
        
        switch timeString {
        case SCHED_TIME_CD.AUTO_START_TIME:
            title = "START AUTO SEARCH"
        case SCHED_TIME_CD.AUTO_STOP_TIME:
            title = "STOP AUTO SEARCH"
        case SCHED_TIME_CD.CONVERT_CSV_TIME:
            title = "CONVERT REALM TO CSV"
        case SCHED_TIME_CD.DRIVE_UPLOAD_TIME:
            title = "UPLOAD TO GOOGLE DRIVE"
        default:
            break
        }
        
        notiContent.title = title
        notiContent.body = body
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.locale = Locale(identifier: "ko_kr")
        let someDateTime = formatter.date(from: timeString)
        
        let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: someDateTime!)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: timeString, content: notiContent, trigger: trigger)
        
        userNotificationCenter.add(request) { error in
            if let error = error {
                print(error)
            }
        }
    }
}


//MARK: - Push Scheduler
extension AppDelegate : UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list, .badge, .sound, .banner])
        
        if let naviVC = SceneDelegate.shared()?.window?.rootViewController as? UINavigationController {
            if let tabVC = naviVC.viewControllers.first as? UITabBarController{
                switch notification.request.identifier {
                case SCHED_TIME_CD.AUTO_START_TIME:
                    tabVC.selectedIndex = 1
                    if let tradeVC = tabVC.selectedViewController as? TradeViewController{
                        tradeVC.sgAutoFlag.selectedSegmentIndex = 1
                        tradeVC.sgAutoTrade(tradeVC.sgAutoFlag)
                    }
                case SCHED_TIME_CD.AUTO_STOP_TIME:
                    tabVC.selectedIndex = 1
                    if let tradeVC = tabVC.selectedViewController as? TradeViewController{
                        tradeVC.sgAutoFlag.selectedSegmentIndex = 0
                        tradeVC.sgAutoTrade(tradeVC.sgAutoFlag)
                    }
                case SCHED_TIME_CD.CONVERT_CSV_TIME:
                    tabVC.selectedIndex = 3
                    if let analysisVC = tabVC.selectedViewController as? AnalysisViewController{
                        let formatter = DateFormatter()
                        formatter.dateFormat = "yyyy_MM_dd"
                        formatter.locale = Locale(identifier: "ko_kr")
                        let today = formatter.string(from: Date())
                        analysisVC.convertRealmToCSV(fileName: today)
                    }
                case SCHED_TIME_CD.DRIVE_UPLOAD_TIME:
                    tabVC.selectedIndex = 3
                    //                if let analysis = tabVC.selectedViewController as? AnalysisViewController{
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy_MM_dd"
                    formatter.locale = Locale(identifier: "ko_kr")
                    let today = formatter.string(from: Date())
                    self.googleAPIService?.googleDrive.uploadCSVFolder(folderName: today)
                //                    analysisVC.uploadToGoogleDrive(fileName: today)
                //                }
                default:
                    break
                }
            }
        }
    }
}
