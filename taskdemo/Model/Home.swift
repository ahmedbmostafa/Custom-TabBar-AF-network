//
//  Home.swift
//  taskdemo
//
//  Created by ahmed mostafa on 11/30/20.
//

import Foundation

struct APIResponse: Decodable {
    
    let status_code: Int?
    let message: String?
    let data: Mydata?
}

struct Mydata: Decodable {
    let attractions: [Myattractions]
    let events: [Myevents]
    let hotSpots: [Myhot_spot]
    
    enum CodingKeys: String, CodingKey {
        case attractions = "attractions"
        case events = "events"
        case hotSpots = "hot_spots"

    }
}

struct Myattractions: Decodable {
    let name: String?
    let categories: [Myatcategories]
    let photos: [String]
}
struct Myatcategories: Decodable {
    let name: String?
}

struct Myevents: Decodable {
    let name: String?
    let categories: [Mycategories]
    
}

struct Mycategories: Decodable {
    let name: String?
    let icon_image_url: String?
}

struct Myhot_spot: Decodable {
    let name: String?
    let neighborhood: Myneighborhood?
    let photos: [String]?
    
}

struct Myneighborhood: Decodable {
    let name: String?
}


