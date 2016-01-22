//
//  WDSpotResult.swift
//  weather-watch
//
//  Created by Javier Fuchs on 11/2/15.
//  Copyright © 2015 MakingSense. All rights reserved.
//

import Foundation
import ObjectMapper

/*
 *  WDSpotResult
 *
 *  Discussion:
 *    Model object representing the result of a forecast query of locations/spots.
 *
 * {
 *  "count": 426,
 *  "spots": [
 *   {
 *    ...
 *   },
 *  ]
 * }
 */


class WDSpotResult: Mappable {
    //
    // count: number of results obtained
    //
    var count: Int?
    
    //
    // spots: is an array of WDSpotOwner objects
    //
    var spots: [WDSpotOwner]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        count <- map["count"]
        spots <- map["spots"]
    }
}
