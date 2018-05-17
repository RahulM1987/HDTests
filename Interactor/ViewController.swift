//
//  ViewController.swift
//  HeadyTest
//
//  Created by Rahul on 24/04/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ArrCategories = [String]()
    var ArrProducts = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Services.sharedInstance.makeAPICall(getAPI: "https://stark-spire-93433.herokuapp.com/json") { (response) in
            //let resultData = try! JSONSerialization.data(withJSONObject: response, options: JSONSerialization.WritingOptions.init(rawValue: 0))
             /*do{
                let decode = try JSONDecoder().decode(Result.self, from: response)

                for getd in decode.categories!{
                    print("Received: \(getd.name!)")

                }
            }
             catch let err as NSError{
                print(err)
            }*/
            
            for getd in response.categories!{
                print("Received: \(getd.name!)")
                self.ArrCategories.append(getd.name!)
                let produts = getd.products
                for getdd in produts{
                    self.ArrProducts.append(getdd.pname!)
                }
                
            }
            print(self.ArrCategories)
            print(self.ArrProducts)

        }
        //let datais = dtacall.makeAPICall(getAPI: "https://stark-spire-93433.herokuapp.com/json")
        //print(datais)
    }
    
    
    
    
    
    
}

