//
//  Subject.swift
//  QuizTime
//
//  Created by Quyen on 4/10/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Foundation
import RealmSwift
class Subject: Object {
    @objc dynamic var subID: String = ""
    @objc dynamic var subName: String = ""
    let questions = List<Question>()
}
//Add subjects
//let hinhhoc = Subject(value:["subID":"HH", "subName": "Hinh Hoc"])
//let realm = try! Realm()

