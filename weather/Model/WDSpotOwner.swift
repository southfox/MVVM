//
//  WDSpotOwner.swift
//  weather-watch
//
//  Created by Javier Fuchs on 11/2/15.
//  Copyright © 2015 MakingSense. All rights reserved.
//

import Foundation
import ObjectMapper

/*
 *  WDSpotOwner
 *
 *  Discussion:
 *    Represents a model information of the stot.
 *    By inheritance the common attributes are parsed and filled in WDSpot.
 *    It adds 2 more properties, nick name and id of the user that controls the weather station.
 *    Probably information not useful now, but in terms of having all the data.
 *
 *     {
 *        "nickname": "oamxyz09",
 *        "id_user": "348765"
 *     }
 * 
 *        
 *
 */

class WDSpotOwner: WDSpot {
    var nickname: String?
    var userId: Int?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        nickname <- map["nickname"]
        userId <- map["id_user"]
    }
}
