//
//  WDForecastModel.swift
//  weather-watch
//
//  Created by Javier Fuchs on 11/2/15.
//  Copyright © 2015 MakingSense. All rights reserved.
//

import Foundation
import ObjectMapper

/*
 *  WDForecastModel
 *
 *  Discussion:
 *    Represents a model information of the weather data inside the model id 
 *    At this moment public models are all "3"
 *    The information contained is of type WDForecast (only one object)
 *
 *        "3": { }
 *
 */

class WDForecastModel: Mappable {
    var info: WDForecast?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        info <- map["3"]
    }
}
