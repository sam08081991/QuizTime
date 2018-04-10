//
//  Question.swift
//  QuizTime
//
//  Created by Quyen on 4/10/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Foundation
import RealmSwift
class Question: Object {
    @objc dynamic var quesID: String = ""
    @objc dynamic var quesContent: String = ""
    @objc dynamic var quesOfSub : Subject?
    var answers = List<Answer>()
}
