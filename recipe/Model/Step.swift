//
//  Step.swift
//  recipe
//
//  Created by Jasmine Shang on 12/9/21.
//

import Foundation
import SwiftyJSON

class Step {
    var stepNo: Int
    var name: String

    init(json: JSON) {
        self.stepNo = json["number"].intValue
        self.name = json["step"].stringValue
    }
}
