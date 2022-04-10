//
//  ResponseBody.swift
//  ResponseBody
//
//  Created by Artem Paliutin on 09/04/2022.
//

import Foundation

struct ResponseBody: Codable {
    var page, perPage, totalResults: Int
    var url: String
    var videos: [Video]
}








