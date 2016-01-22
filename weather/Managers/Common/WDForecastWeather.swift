//
//  WDForecastWeather.swift
//  weather-watch
//
//  Created by Javier Fuchs on 11/2/15.
//  Copyright © 2015 MakingSense. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

/*
 *  WDForecastWeather
 *
 *  Discussion:
 *    Query forecasts and spots, it query weather conditions from any place in the world using http://weather.cz json rest api.
 */

public class WDForecastWeather: NSObject {

    var delegate: WDForecastWeatherDelegate?

    //
    // Attributes only modified by this class
    //
    private var currentSpotResult: WDSpotResult!
    

    //
    // query location
    //
    public func queryLocation(location: String)
    {
        let URL = kWDSearchSpotsUrl + location;
        
        Alamofire.request(.GET, URL, parameters: nil).responseObject { [weak self] (spotResult: WDSpotResult?, error: ErrorType?) in
            if (error != nil)
            {
                if let invoker = self?.delegate
                {
                    invoker.forecast(self!, updateSpotDidFailWithError: Error.errorWithCode(101, failureReason: error.debugDescription))
                }
                return;
            }

            if let invoker = self?.delegate
            {
                if let result = spotResult
                {
                    invoker.forecast(self!, didUpdateSpotResult: result.count != 0, spotResult: result)
                }
                else
                {
                    invoker.forecast(self!, updateSpotDidFailWithError: Error.errorWithCode(103, failureReason: "no forecast"))
                }
            }
        }
    }
    
    //
    // query weather info
    //
    public func queryWeatherInfo(spotId: String)
    {
        let URL = kWDSearchForecastUrl + spotId;
        
        Alamofire.request(.GET, URL, parameters: nil).responseObject { [weak self] (forecastResult: WDForecastResult?, error: ErrorType?) in
            
            if (error != nil)
            {
                if let invoker = self?.delegate
                {
                    invoker.forecast(self!, updateForecastDidFailWithError: Error.errorWithCode(102, failureReason: error.debugDescription))
                }
                return;
            }
            var success : Bool = false
            
            assert(forecastResult?.countryId != 0, "countryId should not be 0")
            
            assert(String(forecastResult?.forecastModel?.info?.windDirectionName?.h000) != NSNull(), "first temperature should not be null")
            print("wind direction: \(String(forecastResult?.forecastModel?.info?.windDirectionName?.h000))")
            print("temperature: \(Double((forecastResult?.forecastModel?.info?.temperature?.h003)! as! NSNumber))")

            if let invoker = self?.delegate
            {
                if let result = forecastResult
                {
                    if (result.countryId != 0)
                    {
                        success = true
                    }
                    invoker.forecast(self!, didUpdateForecastResult: success, forecastResult: result)
                }
                else
                {
                    invoker.forecast(self!, updateForecastDidFailWithError: Error.errorWithCode(104, failureReason: "no forecast"))
                }
            }
        }
    }
    
}
