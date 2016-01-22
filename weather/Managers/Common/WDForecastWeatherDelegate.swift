//
//  WDForecastWeatherDelegate.swift
//  weather-watch
//
//  Created by Javier Fuchs on 11/2/15.
//  Copyright © 2015 MakingSense. All rights reserved.
//

import Foundation

/*
 *  WDForecastWeatherDelegate
 *
 *  Discussion:
 *    Delegate for WDForecastWeather.
 */
protocol WDForecastWeatherDelegate : NSObjectProtocol {
    
    /*
    *  forecast:didUpdateSpotResult:
    *
    *  Discussion:
    *    Invoked when new spots are available.  Required for delivery of
    *    deferred spot results (locations).
    *
    *    spotResult is a WDSpotResult object.
    */
    func forecast(manager: WDForecastWeather, didUpdateSpotResult success: Bool, spotResult: WDSpotResult)

    /*
     *  forecast:didUpdateForecastResult:
     *
     *  Discussion:
     *    Invoked when new forecasts are available.  Required for delivery of
     *    deferred forecasts results (weather info).
     *
     *    forecastResult is a WDForecastResult object.
     */
    func forecast(manager: WDForecastWeather, didUpdateForecastResult success: Bool, forecastResult: WDForecastResult)
    
    func forecast(manager: WDForecastWeather, updateSpotDidFailWithError error: NSError)

    func forecast(manager: WDForecastWeather, updateForecastDidFailWithError error: NSError)

}
