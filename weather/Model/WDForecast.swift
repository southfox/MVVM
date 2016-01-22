//
//  WDForecast.swift
//  weather-watch
//
//  Created by Javier Fuchs on 11/2/15.
//  Copyright © 2015 MakingSense. All rights reserved.
//

import Foundation
import ObjectMapper

/*
 *  WDForecast
 *
 *  Discussion:
 *    Model object representing forecast information, temperature, cloud cover (total, high, 
 *    middle and lower), relative humidity, wind gusts, sea level pressure, feezing level, 
 *    precipitations, wind (speed and direction)
 *
 *  {
 *     "initstamp": 1444197600,
 *     "TMP": { },
 *     "TCDC": { },
 *     "HCDC": { },
 *     "MCDC": { },
 *     "LCDC": { },
 *     "RH": { },
 *     "GUST": { },
 *     "SLP": { },
 *     "FLHGT": { },
 *     "APCP": { },
 *     "WINDSPD": { },
 *     "WINDDIR": { },
 *     "WINDIRNAME": { },
 *     "TMPE": { },
 *     "initdate": "2015-10-07 06:00:00",
 *     "model_name": "GFS 27 km"
 *  }
 */

class WDForecast: Mappable {
    var initStamp: Int32?
    var temperature: WDTimeWeather? // temperature
    var cloudCoverTotal: WDTimeWeather? //  Cloud cover (%) Total
    var cloudCoverHigh: WDTimeWeather? //  Cloud cover (%) High
    var cloudCoverMid: WDTimeWeather? //  Cloud cover (%) Mid
    var cloudCoverLow: WDTimeWeather? //  Cloud cover (%) Low
    var relativeHumidity: WDTimeWeather? //  Relative humidity: relative humidity in percent
    var windGust: WDTimeWeather? //  Wind gusts (knots)
    var seaLevelPressure: WDTimeWeather? //  sea level pressure
    var freezingLevel: WDTimeWeather? //  Freezing Level height in meters (0 degree isoterm)
    var precipitation: WDTimeWeather? //  Precip. (mm/3h)
    var windSpeed: WDTimeWeather? //  Wind speed (knots)
    var windDirection: WDTimeWeather? //  Wind direction
    var windDirectionName: WDTimeWeather? //  wind direction (name)
    var temperatureReal: WDTimeWeather? //  temperature in 2 meters above ground with correction to real altitude of the spot.
    var initDate: NSDate?
    var modelName: String?

    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        initStamp <- map["initstamp"]
        temperature <- map["TMP"]
        cloudCoverTotal <- map["TCDC"]
        cloudCoverHigh <- map["HCDC"]
        cloudCoverMid <- map["MCDC"]
        cloudCoverLow <- map["LCDC"]
        relativeHumidity <- map["RH"]
        windGust <- map["GUST"]
        seaLevelPressure <- map["SLP"]
        freezingLevel <- map["FLHGT"]
        precipitation <- map["APCP"]
        windSpeed <- map["WINDSPD"]
        windDirection <- map["WINDDIR"]
        windDirectionName <- map["WINDIRNAME"]
        temperatureReal <- map["TMPE"]
        initDate <- map["initdate"]
        initDate <- (map["initdate"], DateTransform())
        modelName <- map["model_name"]
    }
}
