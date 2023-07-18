////
////  RealmConfig.swift
////  HundredMillion
////
////  Created by youngkwanji on 2021/01/11.
////  Copyright © 2021 youngkwanji. All rights reserved.
////
//
//import Foundation
//import Realm
////import RealmSwift
//
//class RealmConfig {
//    static func setDefaultRealmForUser(username: String) {
//        // 일정크기 이상 일 시 DB파일 압축
//        var config = Realm.Configuration(shouldCompactOnLaunch: { totalBytes, usedBytes in
//            // totalBytes refers to the size of the file on disk in bytes (data + free space)
//            // usedBytes refers to the number of bytes used by data in the file
//
//            // Compact if the file is over 100MB in size and less than 50% 'used'
//            let oneHundredMB = 100 * 1024 * 1024
//            return (totalBytes > oneHundredMB) && (Double(usedBytes) / Double(totalBytes)) < 0.5
//        })
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy_MM_dd"
//        let dateString = dateFormatter.string(from: Date())
//
//        // 날짜 별로 실시간정보 저장
//        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(dateString).realm")
////        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("s3test.realm")
//
//        do {
//            // Set this as the configuration used for the default Realm
//            Realm.Configuration.defaultConfiguration = config
//        } catch {
//            // handle error compacting or opening Realm
//            LAYOUT_COMMON.showAlert(title: "ALERT", msg: "Realm DB Config FAIL!!!!")
//        }
//    }
//
//    static func getDocumentsDirectory() -> URL {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let documentsDirectory = paths[0]
//        print(documentsDirectory)
//
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
//        return documentsDirectory
//    }
//}
