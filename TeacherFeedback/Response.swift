//
//  Response.swift
//  TeacherFeedback
//
//  Created by Cory Barton on 2/23/18.
//  Copyright © 2018 Cory Barton. All rights reserved.
//

import Foundation


struct Response {
    var questions: String
    var didAnswerYes: Bool
    var rating: Int
    var maximumPossibleRating: Int
    var comments: String?
}
