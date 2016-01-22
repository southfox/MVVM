//
//  WDSpot.swift
//  weather-watch
//
//  Created by Javier Fuchs on 11/2/15.
//  Copyright © 2015 MakingSense. All rights reserved.
//

import Foundation
import ObjectMapper

/*
 *  WDSpot
 *
 *  Discussion:
 *    Model object representing the base class of WDSpotOwner, WDForecastResult.
 *    Is a repeated structure and is easy to integrate using inheritance.
 *
 * {
 *   "id_spot": "64141",
 *   "spotname": "Bariloche",
 *   "country": "Argentina",
 * }
 */

class WDSpot: Mappable {
    var identity: String?
    var name: String?
    var country: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        identity <- map["id_spot"]
        name <- map["spotname"]
        country <- map["country"]
    }
}
