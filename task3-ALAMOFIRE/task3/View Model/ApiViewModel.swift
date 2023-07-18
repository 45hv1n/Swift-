//
//  ApiViewModel.swift
//  task3
//
//  Created by Ashvin Alva on 14/07/23.
//

import Foundation

class ApiViewModel{
    private var url = URL(string: "https://blr-devt1.nxtologies.in/NXT-Toober-WebApp2021/api/v1/guide?platform=lg&version=1.0")!
    
    var dataModel : DataModel?
    
    func getData(completion: @escaping () -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data{
                let result = try! JSONDecoder().decode(DataModel.self, from: data)
                
                self.dataModel = result
                completion()
            }
            
            //print(self.dataModel)
        }.resume()
    }
}


//URLSession.shared.dataTask(with: URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!,completionHandler: {data, response, error in
//
//    print(data)
//    guard let data = data, error == nil  else{
//        return
//    }
//    var result: Request?
//    do{
//        result = try JSONDecoder().decode(Request.self, from: data)
//        print("meow response in getdata \(result)")
//    }
//    catch{
//        print("Response Error \(error.localizedDescription)")
//    }
//    guard let json = result else{
//        return
//    }
//
//    print("\n\n\nExplanation:")
//
//    //self.img.image = UIImage(named:json.url)
//    //self.txt.text = json.explanation
//    print(json.explanation)
//
//}).resume()
