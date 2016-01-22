//
//  WDForecastResult.swift
//  weather-watch
//
//  Created by Javier Fuchs on 11/2/15.
//  Copyright © 2015 MakingSense. All rights reserved.
//

import Foundation
import ObjectMapper

/*
 *  WDForecastResult
 *
 *  Discussion:
 *    Represents a model information of the stot or location when the forecast is obtained.
 *    By inheritance the common attributes are parsed and filled in WDSpot.
 *    Contains id of the spot, spot name, country, latitude, longitude, altitude, timezone,
 *    GMT hour offset, time of sunrise/sunset, the models (normal 3 is the public model), and the
 *    complete forecast (inside a single instance of WDForecastModel)
 *
 *   {
 *       "id_spot": "64141",
 *       "spotname": "Bariloche",
 *       "country": "Argentina",
 *       "id_country": 32,
 *       "lat": -41.1281,
 *       "lon": -71.348,
 *       "alt": 770,
 *       "tz": "America/Argentina/Mendoza",
 *       "gmt_hour_offset": -3,
 *       "sunrise": "07:11",
 *       "sunset": "19:54",
 *       "models": [
 *           "3"
 *       ],
 *       "tides": "0",
 *       "forecast": { ... }
 *   }
 *        
 *
 */

class WDForecastResult: WDSpot {
    var countryId: Int?
    var latitude: Double?
    var longitude: Double?
    var altitude: Int?
    var timezone: String?
    var gmtHourOffset: Int?
    var sunrise: String?
    var sunset: String?
    var models: Array<String>?
    var tides: String?
    var forecastModel: WDForecastModel?

    required init?(_ map: Map){
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        countryId <- map["id_country"]
        latitude <- map["lat"]
        longitude <- map["lon"]
        altitude <- map["alt"]
        timezone <- map["tz"]
        gmtHourOffset <- map["gmt_hour_offset"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
        models <- map["models"]
        tides <- map["tides"]
        forecastModel <- map["forecast"]
    }
}
