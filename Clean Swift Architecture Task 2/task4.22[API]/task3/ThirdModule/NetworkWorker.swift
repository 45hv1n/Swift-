//
//  NetworkWorker.swift
//  task3
//
//  Created by Ashvin Alva on 31/07/23.
//

import Foundation

class NetworkWorker{
    var dataModel : DataModel?
    
    func sendAPIRequest(url: URL,completion: @escaping () -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("Error")
            }
            else if let data = data{
                let result = try! JSONDecoder().decode(DataModel.self, from: data)
                
                Storage.data = result
                            
                print("Request Successful")
                completion()
            }
        }.resume()
    }
}
