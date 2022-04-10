//
//  Video.swift
//  VideoPlayerJson
//
//  Created by Artem Paliutin on 10/04/2022.
//

import Foundation

 

struct Video: Identifiable, Codable {
    var id: Int
    var url: String
    var image: String
    var duration: Int
    var user: User
    var videoFiles: [VideoFile]
    //var videoPictures: [VideoPicture]
    
    // MARK: User
    struct User: Identifiable, Codable {
        var id: Int
        var name: String
        var url: String
    }

    // MARK: VideoFile
    struct VideoFile: Identifiable, Codable {
        var id: Int
        var quality, fileType: String
        //var width, height: Int?
        var link: String
    }

    // MARK: VideoPicture
//    struct VideoPicture: Codable, Identifiable {
//        let id: Int
//        let picture: String
//        let nr: Int
//    }
}
