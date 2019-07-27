//
//  GaanaResult.swift
//  GaanaTest
//
//  Created by KingpiN on 27/07/19.
//  Copyright © 2019 KingpiN. All rights reserved.
//

import Foundation

struct GaanaResult: Codable {
    var status: Int?
    var sections: [Sections] = []
}
