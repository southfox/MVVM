//
//  WDTimeWeather.swift
//  weather-watch
//
//  Created by Javier Fuchs on 11/2/15.
//  Copyright © 2015 MakingSense. All rights reserved.
//

import Foundation
import ObjectMapper

/*
 *  WDTimeWeather
 *
 *  Discussion:
 *    Represents a model information of the weather schedule every 3 hours from the time of 
 *    recovering.
 *    Here the information could come as Int, Double, String. A convenient AnyObject helps to 
 *    reduce code for now.
 *    
 *    TODO: the best thing to do here is to remove all the interminable attributes and use directly
 *          an array :)
 *
 *    Example: information of temperature in celsius.
 *     {
 *         "0": -1,
 *         "3": -1.4,
 *         "6": 0.1,
 *         "9": 2.7,
 *         "12": 3.3,
 *         "15": 2,
 *         "18": -3.1,
 *         "21": -4.3,
 *         "24": -5,
 *         "27": -5.5,
 *         "30": -0.7,
 *         "33": 4.7,
 *         "36": 6.3,
 *         "39": 4.9,
 *         "42": -1.4,
 *         "45": -1.7,
 *         "48": -1.7,
 *         "51": -1.5,
 *         "54": 2.8,
 *         "57": 6,
 *         "60": 7.6,
 *         "63": 7.2,
 *         "66": 1.2,
 *         "69": 0.6,
 *         "72": -0.3,
 *         "75": -0.8,
 *         "78": 2.9,
 *         "81": 6.3,
 *         "84": 8.2,
 *         "87": 7.3,
 *         "90": 2.2,
 *         "93": 1.3,
 *         "96": -0.1,
 *         "99": 1.3,
 *         "102": 2.1,
 *         "105": 5,
 *         "108": 6.5,
 *         "111": 7.1,
 *         "114": 2.5,
 *         "117": 1.6,
 *         "120": 1.7,
 *         "123": 1.8,
 *         "126": 4.1,
 *         "129": 7.2,
 *         "132": 8.2,
 *         "135": 6,
 *         "138": 3.6,
 *         "141": 3.2,
 *         "144": 3.1,
 *         "147": 3,
 *         "150": 3.3,
 *         "153": 4.7,
 *         "156": 3.8,
 *         "159": 2.3,
 *         "162": -1.5,
 *         "165": -1.5,
 *         "168": -2.6,
 *         "171": -2.9,
 *         "174": -1.1,
 *         "177": 2.4,
 *         "180": 3.9
 *     }
 *
 */


class WDTimeWeather: Mappable {
    var h000: AnyObject?
    var h003: AnyObject?
    var h006: AnyObject?
    var h009: AnyObject?
    var h012: AnyObject?
    var h015: AnyObject?
    var h018: AnyObject?
    var h021: AnyObject?
    var h024: AnyObject?
    var h027: AnyObject?
    var h030: AnyObject?
    var h033: AnyObject?
    var h036: AnyObject?
    var h039: AnyObject?
    var h042: AnyObject?
    var h045: AnyObject?
    var h048: AnyObject?
    var h051: AnyObject?
    var h054: AnyObject?
    var h057: AnyObject?
    var h060: AnyObject?
    var h063: AnyObject?
    var h066: AnyObject?
    var h069: AnyObject?
    var h072: AnyObject?
    var h075: AnyObject?
    var h078: AnyObject?
    var h081: AnyObject?
    var h084: AnyObject?
    var h087: AnyObject?
    var h090: AnyObject?
    var h093: AnyObject?
    var h096: AnyObject?
    var h099: AnyObject?
    var h102: AnyObject?
    var h105: AnyObject?
    var h108: AnyObject?
    var h111: AnyObject?
    var h114: AnyObject?
    var h117: AnyObject?
    var h120: AnyObject?
    var h123: AnyObject?
    var h126: AnyObject?
    var h129: AnyObject?
    var h132: AnyObject?
    var h135: AnyObject?
    var h138: AnyObject?
    var h141: AnyObject?
    var h144: AnyObject?
    var h147: AnyObject?
    var h150: AnyObject?
    var h153: AnyObject?
    var h156: AnyObject?
    var h159: AnyObject?
    var h162: AnyObject?
    var h165: AnyObject?
    var h168: AnyObject?
    var h171: AnyObject?
    var h174: AnyObject?
    var h177: AnyObject?
    var h180: AnyObject?

    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        h000 <- map["0"]
        h003 <- map["3"]
        h006 <- map["6"]
        h009 <- map["9"]
        h012 <- map["12"]
        h015 <- map["15"]
        h018 <- map["18"]
        h021 <- map["21"]
        h024 <- map["24"]
        h027 <- map["27"]
        h030 <- map["30"]
        h033 <- map["33"]
        h036 <- map["36"]
        h039 <- map["39"]
        h042 <- map["42"]
        h045 <- map["45"]
        h048 <- map["48"]
        h051 <- map["51"]
        h054 <- map["54"]
        h057 <- map["57"]
        h060 <- map["60"]
        h063 <- map["63"]
        h066 <- map["66"]
        h069 <- map["69"]
        h072 <- map["72"]
        h075 <- map["75"]
        h078 <- map["78"]
        h081 <- map["81"]
        h084 <- map["84"]
        h087 <- map["87"]
        h090 <- map["90"]
        h093 <- map["93"]
        h096 <- map["96"]
        h099 <- map["99"]
        h102 <- map["102"]
        h105 <- map["105"]
        h108 <- map["108"]
        h111 <- map["111"]
        h114 <- map["114"]
        h117 <- map["117"]
        h120 <- map["120"]
        h123 <- map["123"]
        h126 <- map["126"]
        h129 <- map["129"]
        h132 <- map["132"]
        h135 <- map["135"]
        h138 <- map["138"]
        h141 <- map["141"]
        h144 <- map["144"]
        h147 <- map["147"]
        h150 <- map["150"]
        h153 <- map["153"]
        h156 <- map["156"]
        h159 <- map["159"]
        h162 <- map["162"]
        h165 <- map["165"]
        h168 <- map["168"]
        h171 <- map["171"]
        h174 <- map["174"]
        h177 <- map["177"]
        h180 <- map["180"]
    }
}
