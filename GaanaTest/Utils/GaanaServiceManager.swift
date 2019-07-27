//
//  GaanaServiceManager.swift
//  GaanaTest
//
//  Created by KingpiN on 27/07/19.
//  Copyright © 2019 KingpiN. All rights reserved.
//

import Foundation

class GaanaServiceManager {
    
    static let shared = GaanaServiceManager()
    private init() {}
    
    func createGetRequestWith(urlString: String,
                               parameters: [String : Any]? = nil,
                               success: @escaping (Data?) -> (),
                               failure: @escaping (NSError) -> ()) {
        guard let url = URL(string: urlString) else {
            failure(NSError.init(domain: "Invalid URL", code: 400, userInfo: nil))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let unwrappedData = data else {
                failure(NSError.init(domain: "Data Vaildation failed", code: 400, userInfo: nil))
                return
            }
            do {
                let str = try JSONSerialization.jsonObject(with: unwrappedData, options: .allowFragments)
                print(str)
                success(unwrappedData)
            } catch {
                failure(error as NSError)
            }
        }
        task.resume()
    }
}
