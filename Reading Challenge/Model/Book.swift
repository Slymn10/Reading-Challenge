//
//  Book.swift
//  Reading Challenge
//
//  Created by Süleyman Koçak on 18.03.2020.
//  Copyright © 2020 Suleyman Kocak. All rights reserved.
//

import Foundation

struct Book:Codable{
    let totalItems : Int
    let items : [Item]
}
struct Item :Codable{
    let volumeInfo : VolumeInfo
}
struct VolumeInfo:Codable{
    let title:String
    let imageLinks:ImageLinks
    let authors:[String]
    let description:String?
    let averageRating:Float?
    let pageCount:Int?
}
struct ImageLinks:Codable{
    let thumbnail:String
}

