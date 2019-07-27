//
//  DataStore.swift
//  GaanaTest
//
//  Created by KingpiN on 27/07/19.
//  Copyright © 2019 KingpiN. All rights reserved.
//

import Foundation

class DataStore {
    
    static let shared = DataStore()
    private init(){}
    
    func createGetRequestForGaanaFeed(parameters: [String : Any]? = nil, success: @escaping (GaanaResult) -> () , failure: @escaping (NSError) -> ()) {
        
        let urlString = "https://demo3033278.mockable.io/gaanaDriveTest"
        GaanaServiceManager.shared.createGetRequestWith(urlString: urlString, parameters: parameters, success: { (response) in
            guard let dataToParse = response else { return }
            do {
                let parsedResult = try JSONDecoder().decode(GaanaResult.self, from: dataToParse)
                success(parsedResult)
            } catch let error {
                failure(error as NSError)
            }
        }) { (error) in
            failure(error)
        }
    }
}
