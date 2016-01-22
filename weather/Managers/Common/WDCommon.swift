//
//  WDCommon.swift
//  weather-watch
//
//  Created by Javier Fuchs on 11/2/15.
//  Copyright © 2015 MakingSense. All rights reserved.
//

import Foundation

/*
 *  WDCommon
 *
 *  Discussion:
 *    Some common and global constants.
 */


let kWDLocationUpdated : String = "WDLocationUpdated"

let kWDForecastUpdated : String = "WDForecastUpdated"

let kWDWatchPlist: String = "WDWatch.plist"

let kWDGroup : String = "group.fuchs.weather"

let kWDKeyLocality : String = "locality"

let kWDKeyCountry : String = "country"

let kWDMinimumDistanceFilterInMeters : Double = 60.0 // update every 200ft

let kWDSearchSpotsUrl = "https://www.windguru.cz/int/jsonapi.php?client=wgapp&q=search_spots&username=southfox&password=zorrito1&search="

let kWDSearchForecastUrl = "https://www.windguru.cz/int/jsonapi.php?client=wgapp&q=forecast&username=southfox&password=zorrito1&id_model=3&id_spot="

let kWDAnimationDuration: Double = 2.0
