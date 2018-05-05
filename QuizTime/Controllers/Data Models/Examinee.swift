//
//  Examinee.swift
//  QuizTime
//
//  Created by Quyen on 4/10/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Foundation
import RealmSwift
class Examinee: Object {
    @objc dynamic var UID: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var username: String = ""
    let scores = List<Score>()

}
