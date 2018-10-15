//
//  ViewController.swift
//  RESTAPITutorial
//
//  Created by YOUNGSIC KIM on 2018-10-14.
//  Copyright © 2018 YOUNGSIC KIM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // This url give RANDOM Json format.
        // The URL data change when I refresh
        let urlString = "http://api.randomuser.me/"
        // Make Request
        let request: URLRequest = URLRequest(url: URL(string: urlString)!)
        // Get JSON data from URL String
        URLSession.shared.dataTask(with: request) { (data: Data?, resonse: URLResponse?, error: Error?) in
            do {
                // JSON Data to NSDictionary
                let json = try JSONSerialization.jsonObject(with: data!) as! NSDictionary
                // Get the result array
                if let resultsArray = json.object(forKey: "results") as? NSArray {
                    let resultDictionary: NSDictionary = resultsArray[0] as! NSDictionary
                    // Now we can get a value from dictionary
                    if let email = resultDictionary["email"] {
                        print("email is \(email)")
                    }
                    if let phone = resultDictionary["phone"] {
                        print("phone is \(phone)")
                    }
                }
            } catch {
                print("error")
            }
        }.resume()
    }
}

