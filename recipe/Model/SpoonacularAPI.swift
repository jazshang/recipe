//
//  SpoonacularAPI.swift
//  recipe
//
//  Created by Jasmine Shang on 12/9/21.
//

import Foundation
import Moya
import CoreData

enum SpoonacularAPI {

    case findRecipesByIngredients(ingredients: [Ingredient])
    case getRecipeInformation(id:Int)
    case getRecipesByName(dishName: String)
}

extension SpoonacularAPI: TargetType {

    var baseURL: URL {
        return URL(string: "https://api.spoonacular.com/")!
    }

    var path: String {
        switch self {
        case .findRecipesByIngredients(_):
            return "recipes/findByIngredients"
        case .getRecipeInformation(let id):
            return "recipes/\(id)/analyzedInstructions"
        case .getRecipesByName(_):
        return "recipes/search"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        return "".data(using: .utf8)!
    }

    var task: Task {
        switch self {
        case .findRecipesByIngredients(let ingredients):
            return .requestParameters(parameters:
                [
                    "ingredients": ((ingredients.map({ $0.name! })).joined(separator: ",+")),
                    "apiKey": Spoonacular.apiKey
                ], encoding: URLEncoding.default)
        case .getRecipesByName(let dishName):
            return .requestParameters(parameters: ["apiKey": Spoonacular.apiKey, "query": dishName, "number": 10], encoding: URLEncoding.default)
        default:
            return .requestParameters(parameters: [ "apiKey": Spoonacular.apiKey ], encoding: URLEncoding.default)
        }
    }

    var headers: [String : String]? {
        return nil
    }

}
