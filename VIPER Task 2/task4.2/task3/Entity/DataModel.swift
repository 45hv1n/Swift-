//
//  DataModel.swift
//  task3
//
//  Created by Ashvin Alva on 14/07/23.
//

import Foundation


struct DataModel: Codable{
    var success: Bool?
    var data: Data?
}

struct Data: Codable{
    var channels: [Channels]?
}

struct Channels: Codable{
    var id : String?
    var number : Int?
    var title: String?
    var logo: String?
    var isFreeChannel: Bool?
    var isFreePreview: Bool?
    var ratingID: String?
    var genreIDs: [String]?
    var languageIDs: [String]?
    var videoSourceURLs: [String]?
    var airings: [Alrings]?
}

struct Alrings: Codable{
    var title: String?
    var type: String?
    var description: String?
    var startDateTime: String?
    var endDateTime: String?
    var duration: Int?
    var id: String?
}

