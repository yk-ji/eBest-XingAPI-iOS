//
//  GoogleAuthService.swift
//  HundredMillion
//
//  Created by youngkwanji on 2021/02/01.
//  Copyright © 2021 youngkwanji. All rights reserved.
//

import Foundation
import GoogleSignIn
import GoogleAPIClientForREST

class GoogleAPIService : NSObject{
    
    var googleDrive = GoogleDrive.init()
    
    override init() {
        super.init()
        GIDSignIn.sharedInstance()?.clientID = PRIVATE_KEY.GOOGLE_CLIENT_ID.rawValue
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = SceneDelegate.shared()?.window?.rootViewController
        GIDSignIn.sharedInstance()?.scopes = [kGTLRAuthScopeDrive,kGTLRAuthScopeDriveFile]

        let UD = UserDefaults.standard
        if UD.bool(forKey: USER_DEFAULT_CD.GOOGLE_DRIVE){
            if let _ = GIDSignIn.sharedInstance()?.hasPreviousSignIn(){
                GIDSignIn.sharedInstance()?.restorePreviousSignIn()
            }else{
                GIDSignIn.sharedInstance()?.signIn()
            }
        }else{
            GIDSignIn.sharedInstance()?.signIn()
        }
    }
}


//MARK: - GIDSignInDelegate
extension GoogleAPIService : GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        let UD = UserDefaults.standard
        
        // Check for sign in error
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            
            UD.setValue(false, forKey: USER_DEFAULT_CD.GOOGLE_DRIVE)
            return
        }
        
        // Post notification after user successfully sign in
        UD.setValue(true, forKey: USER_DEFAULT_CD.GOOGLE_DRIVE)
        googleDrive.googleUser = user
        googleDrive.googleDriveService.authorizer = user.authentication.fetcherAuthorizer()
        PushNotiService.init().showNotification(title: "Google SignIn", body: "Success")
    }
}
