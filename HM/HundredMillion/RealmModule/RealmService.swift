////
////  RealmService.swift
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
//class RealmService {
//    let realm = try! Realm()
//    
//    static func shared() -> RealmService{
//        let me = RealmService()
//        return me
//    }
// 
//    func insertS3_(result: RESULT_S3_){
////        let realm = try! Realm()
//        
//        let s3 = S3_()
//        s3.shcode = result.shcode
//        s3.chetime = result.chetime
//        s3.drate = result.drate
//        s3.price = result.price
//        s3.cgubun = result.cgubun
//        s3.cvolume = result.cvolume
//        s3.volume = result.volume
//        s3.mdvolume = result.mdvolume
//        s3.mdchecnt = result.mdchecnt
//        s3.msvolume = result.msvolume
//        s3.mschecnt = result.mschecnt
//        s3.jnilvolume = result.jnilvolume
//
//        do{
//            try realm.write{
//                realm.add(s3)
//            }
//        } catch {
//            print("Error Add \(error)")
//        }
//
//    }
//    
//    func insertPH_(result: RESULT_PH_){
////        let realm = try! Realm()
//
//        let ph = PH_()
//        ph.shcode = result.shcode
//        ph.time = result.time
//        ph.drate = result.drate
//        ph.price = result.price
//        ph.volume = result.volume
//        ph.cdhrem = result.cdhrem
//        ph.cshrem = result.cshrem
//        ph.bdhrem = result.bdhrem
//        ph.bshrem = result.bshrem
//        ph.cdhvolume = result.cdhvolume
//        ph.cshvolume = result.cshvolume
//        ph.bdhvolume = result.bdhvolume
//        ph.bshvolume = result.bshvolume
//        ph.tdvolume = result.tdvolume
//        ph.tsvolume = result.tsvolume
//        ph.tvol = result.tvol
//
//        do{
//            try realm.write{
//                realm.add(ph)
//            }
//        } catch {
//            print("Error Add \(error)")
//        }
//
//    }
//}
