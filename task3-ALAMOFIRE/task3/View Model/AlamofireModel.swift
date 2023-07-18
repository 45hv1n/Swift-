//
//  Alamofire.swift
//  task3
//
//  Created by Ashvin Alva on 15/07/23.
//

import Foundation
import Alamofire

class NetworkingClient {
    private var url = URL(string: "https://blr-devt1.nxtologies.in/NXT-Toober-WebApp2021/api/v1/guide?platform=lg&version=1.0")!
    
    var dataModel : DataModel?

    func execute(completion : @escaping () -> ()){
        AF.request(url).responseJSON { response in
            if let data = response.data{
                let result = try! JSONDecoder().decode(DataModel.self, from: data)
                
                self.dataModel = result
                completion()
            }
        }
    }
}
