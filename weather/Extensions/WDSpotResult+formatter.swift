//
//  WDSpotResult+formatter.swift
//  weather-watch
//
//  Created by Javier Fuchs on 11/2/15.
//  Copyright © 2015 MakingSense. All rights reserved.
//

import Foundation

extension WDSpotResult
{
    var asCurrentLocation: String {
        
        var currentLocation : String!
        
        currentLocation = self.spots?.last?.name
        
        return currentLocation
    }
}
