//
//  GoogleDriveService.swift
//  HundredMillion
//
//  Created by youngkwanji on 2021/02/01.
//  Copyright © 2021 youngkwanji. All rights reserved.
//

import Foundation
import GoogleSignIn
import GoogleAPIClientForREST
import GTMSessionFetcher

class GoogleDrive : NSObject{
    let googleDriveService = GTLRDriveService()
    var googleUser: GIDGoogleUser?
    var uploadFolderID: String?
    
    override init() {
        super.init()
        
    }
    func uploadCSVFolder(folderName: String){
        let folder = GTLRDrive_File()
        folder.mimeType = "application/vnd.google-apps.folder"
        folder.name = folderName
        folder.parents = [PRIVATE_KEY.CSV_FOLDER_ID.rawValue]
        
        // Google Drive folders are files with a special MIME-type.
        let query = GTLRDriveQuery_FilesCreate.query(withObject: folder, uploadParameters: nil)
        
        googleDriveService.executeQuery(query) { (_, file, error) in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            
            let folder = file as! GTLRDrive_File
            self.uploadFile(folderId: folder.identifier!, fileName: folderName + "_PH_.csv")
            self.uploadFile(folderId: folder.identifier!, fileName: folderName + "_S3_.csv")
        }
    }
    
    func uploadFile(folderId: String, fileName: String){
        let fileURL = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, .userDomainMask, true)[0] + "/" + fileName
        
        var uploadParameters : GTLRUploadParameters?
        let csvFile = GTLRDrive_File.init()
        csvFile.parents = [folderId]
        csvFile.name = fileName
        
        let data = try? Data.init(contentsOf: URL(fileURLWithPath: fileURL))
        if let nData = data {
            uploadParameters = GTLRUploadParameters.init(data: nData, mimeType: "text/csv")
            let query = GTLRDriveQuery_FilesCreate.query(withObject: csvFile, uploadParameters: uploadParameters)

            googleDriveService.executeQuery(query) { (_, result, error) in
                guard error == nil else {
                    fatalError(error!.localizedDescription)
                }
            }
        }
    }
    
    func getFileList(){
        guard let _ = googleUser else {
            //            LAYOUT_COMMON.showAlert(title: "GOOGLE API", msg: "NOT FOUND GOOLE USER")
            return
        }
        
        let query = GTLRDriveQuery_FilesList.query()
        let root = "mimeType = 'application/vnd.google-apps.folder'"
        query.pageSize = 100
        query.q = root
        query.fields = "files(id,name,mimeType,modifiedTime,createdTime,fileExtension,size),nextPageToken"
        query.spaces = "drive"
        query.corpora = "user"
        //        query.orderBy = "folder,name"
        
        googleDriveService.executeQuery(query) { (_, result, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            let folderList = result as! GTLRDrive_FileList
            guard let files = folderList.files else { return }
            for file in files {
                print("file.name: \(file.name ?? ""), file.mimeType: \(file.mimeType ?? ""), file.fileExtension: \(file.fileExtension ?? "")")
            }
        }
    }
    
    
}
