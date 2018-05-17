//
//  DataCalls.swift
//  HeadyTest
//
//  Created by Rahul on 24/04/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation


class Services {
   
    static let sharedInstance = Services()
    
    func makeAPICall(getAPI: String, completion:@escaping (Result) -> () )
    {
        print("In api call")
        let URLString = getAPI
        let url = URL(string: URLString)
        var decode = Result()
        
        var responseDict = NSDictionary()
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                responseDict = jsonResponse as! NSDictionary
                let data = try! JSONSerialization.data(withJSONObject: responseDict, options: JSONSerialization.WritingOptions.init(rawValue: 0))
                decode = try JSONDecoder().decode(Result.self, from: data)
            }
            catch let error
            {
                print(error)
            }
            completion(decode)
            }.resume()
        
    }
}


struct Result: Codable {
    
    var categories: [Subcategories]?
    var rankings: [Rankings]?
    
    enum ResultKeys: String, CodingKey {
        case categories = "categories"
        case rankings = "rankings"
    }
    
    struct Subcategories: Codable {
        var id:Int?
        var name: String?
        var products: [products]
        
        enum SubcategoriesKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case products = "products"
            
        }
        struct products: Codable {
            var pid:Int?
            var pname: String?
            var pdate_added: String?
            var pvariants: [variants]?
            
            enum productsKeys: String, CodingKey {
                case id = "id"
                case name = "name"
                case pdate_added = "date_added"
            }
            
            struct variants: Codable {
                var vid:Int?
                var vcolor: String?
                var vsize: Int?
                var vprice: Int?
                
                
                enum variantsKeys: String, CodingKey {
                    case vid = "id"
                    case vcolor = "color"
                    case vsize = "size"
                    case vprice = "price"
                }
            }
        }
    }
    
    struct Rankings: Codable {
        var ranking: String?
        var products: [products]?
        
        enum RankingsKeys: String, CodingKey {
            case ranking = "ranking"
        }
        
        struct products: Codable {
            var pid:Int?
            var pview_count: Int?
            
            enum productsKeys: String, CodingKey {
                case id = "id"
                case pview_count = "view_count"
            }
        }
    }
    
}





/*struct APICallsResource {
    
    var baseURL = "https://stark-spire-93433.herokuapp.com/"
    
    init(url: String) {
        baseURL = baseURL + url
    }
    
    func FirstAPI() -> Dictionary<String, Any> {
        let firstapi = makeAPICall(getAPI: baseURL)
        return firstapi
    }
    
    func makeAPICall(getAPI: String) -> Dictionary<String, Any>
    {
        let URLString = getAPI
        let url = URL(string: URLString)
        
        var responseDict = Dictionary<String, Any>()
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                responseDict = jsonResponse as! [String : Any]
                //print(jsonResponse as! NSDictionary)
            }
            catch let error
            {
                print(error)
            }
            guard let data = data else { return }
            print(data)
            }.resume()
        
        return responseDict
    }
    
}*/





