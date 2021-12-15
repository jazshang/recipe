//
//  Recipe.swift
//  recipe
//
//  Created by Jasmine Shang on 12/9/21.
//

import Foundation
import SwiftyJSON

class Recipe {
    var id: Int
    var name: String
    var image: UIImage?

    init(json: JSON) {
        self.id = json["id"].intValue
        self.name = json["title"].stringValue
        setImage(from: json["image"].stringValue)
    }

    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else {
                self.image = #imageLiteral(resourceName: "food")
                return }
            let image = UIImage(data: imageData)
            self.image = image
        }
    }
}
