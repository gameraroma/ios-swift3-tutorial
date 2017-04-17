//
//  Item.swift
//  PracticeTableView
//
//  Created by Chakpiwat Pacharajindawat on 174//60 BE.
//  Copyright © 2560 Codium. All rights reserved.
//

import Foundation

class Item: NSObject, NSCoding {
    var name: String

    init(name: String) {
        self.name = name
        super.init()
    }
    
    static let Dir = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = Dir.appendingPathComponent("items")

    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
    }

    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        self.init(name: name)
    }
}
