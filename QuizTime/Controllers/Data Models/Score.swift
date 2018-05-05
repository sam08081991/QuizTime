//
//  Score.swift
//  QuizTime
//
//  Created by Quyen on 4/10/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Foundation
import RealmSwift
class Score: Object {
    @objc dynamic var scoreOfUser: Examinee?
    @objc dynamic var scoreOfSub: Subject?
    @objc dynamic var scoreOfTest: Int = 0
    @objc dynamic var date: Date?
}
