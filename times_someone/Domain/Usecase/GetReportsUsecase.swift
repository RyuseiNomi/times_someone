//
//  GetReportsUsecase.swift
//  times_someone
//
//  Created by 能美龍星 on 2019/11/20.
//  Copyright © 2019 Ryusei Nomi. All rights reserved.
//

import Foundation
import Firebase

class GetReportsUsecase: GetReportProtocol {
    var reports = [Report]()
    let db = Firestore.firestore()
    
    /**
     * Get all reports from firestore
     */
    public func getAllReports(completion: @escaping ([Report])->()) {
        let reportDocRef = db.collection("reports")
        reportDocRef.getDocuments() { (querySnapshot, err) in
            if err == nil, let querySnapshot = querySnapshot {
                for document in querySnapshot.documents {
                    let data = document.data()
                    let timestamp = data["createdAt"]
                    print(timestamp)
                    let report = Report(author: data["author"], content: data["content"] as! String, createdAt: data["createdAt"] as! Date)
                    self.reports.append(report)
                }
                completion(self.reports)
            } else if err != nil {
                completion(self.reports)
                print("\(err)")
            }
        }
    }
}
