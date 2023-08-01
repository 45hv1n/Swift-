//
//  Object.swift
//  task2
//
//  Created by Ashvin Alva on 05/07/23.
//

import Foundation


class Object: Encodable{
    
    var name : String = ""
    var id : String = ""
    var department : String = ""
    var phone : String = ""
    var aggregate : String = ""
    var email : String = ""
}

extension Encodable{
    
    var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}
