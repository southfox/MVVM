//
//  WDForecastResult+formatter.swift
//  weather-watch
//
//  Created by Javier Fuchs on 11/2/15.
//  Copyright © 2015 MakingSense. All rights reserved.
//

import Foundation

extension WDForecastResult
{
    
    private func weatherType() -> String
    {
        // 
        // information comes in UTC, contains the every 3 hours information
        //

        /*
        WeatherCloudy
        WeatherCloudyRain
        WeatherCloudyRainStorm
        WeatherCloudySnow
        WeatherCloudySnowWater
        WeatherFog
        WeatherMoon
        WeatherMoonCloud
        WeatherMoonCloudMore
        WeatherMoonCloudRain
        WeatherMoonCloudRainMore
        WeatherMoonCloudSnow
        WeatherMoonCloudSnowMore
        WeatherSun
        WeatherSunCloud
        WeatherSunCloudMore
        WeatherSunCloudRain
        WeatherSunCloudRainMore
        WeatherSunCloudSnow
        WeatherSunCloudSnowMore
        WeatherSunCloudSnowRain
    */
        if (self.isSunny())
        {
            if (self.isNight())
            {
                return "WeatherMoon"
            }
            return "WeatherSun"
        }
        return "WeatherFog"
    }

    private func isNight() -> Bool
    {
        let hour: Int = self.hourInt()
        if hour > 19
        {
            return true
        }
        if hour < 6
        {
            return true
        }
        return false
    }
    private func isSunny() -> Bool
    {
        // if TCDC is == 0

        if cloudCoverTotal() == 0
        {
            return true
        }
        return false
    }
    
    private func isCloudy() -> Bool
    {
        if cloudCoverTotal() == 0
        {
            return false
        }
        return true
    }


    private func cloudCoverTotal() -> Int
    {
        var cloudCoverTotal: Int!

        let key = self.forecastModel?.info?.cloudCoverTotal
        
        let value : AnyObject!
        
        switch hourString() {
        case "000": value = key?.h000
            break
        case "003": value = key?.h003
            break
        case "006": value = key?.h006
            break
        case "009": value = key?.h009
            break
        case "012": value = key?.h012
            break
        case "015": value = key?.h015
            break
        case "018": value = key?.h018
            break
        case "021": value = key?.h021
            break
        case "024": value = key?.h024
            break
        default: value = key?.h024
        }
        
        cloudCoverTotal = value! as! Int
        
        return cloudCoverTotal
    }

    
    private func hourInt() -> Int
    {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(NSCalendarUnit.Hour, fromDate: date)
        let hour = components.hour
        
        // TODO: Timezone
        
        return hour;
    }
    
    private func hour() -> Int
    {
        var hour: Int = self.hourInt()
        let remainder = hour % 3
        
        hour -= remainder
        
        // TODO: here the increment
        
        return hour
    }

    private func hourString() -> String
    {
        var hourString: String!
        let hour: Int = self.hour()

        hourString = String(format: "%03d", hour)
        
        return hourString
    }
    

    var asHourString: String
    {
        var hourString: String!
        let hour: Int = self.hour()

        hourString = String(format: "%02d hs", hour)
        
        return hourString
    }
    
    // "WeatherSun"
    var asCurrentWeatherImagename: String {

        var imageName : String!
        
        imageName = self.weatherType()
        
        return imageName

    }
    
    
    // "WindDirectionN"
    var asCurrentWindDirectionImagename: String {
        
        var imageName : String!
        
        imageName = "WindDirection\(self.asCurrentWindDirectionName)"
        
        return imageName
    }
    
    var asCurrentWindDirectionName: String {
        
        var windDirectionName: String!
        
        let key = self.forecastModel?.info?.windDirectionName
        
        let value : AnyObject!
        
        switch hourString() {
            case "000": value = key?.h000
                break
            case "003": value = key?.h003
                break
            case "006": value = key?.h006
                break
            case "009": value = key?.h009
                break
            case "012": value = key?.h012
                break
            case "015": value = key?.h015
                break
            case "018": value = key?.h018
                break
            case "021": value = key?.h021
                break
            case "024": value = key?.h024
                break
            default: value = key?.h024
        }

        windDirectionName = value! as! String

        return windDirectionName
    }
    
    var asCurrentWindSpeed: String {
        
        var windSpeedStr: String!
        var windSpeed: Double!
        
        let key = self.forecastModel?.info?.windSpeed
        
        let value : AnyObject!
        
        switch hourString() {
            case "000": value = key?.h000
                break
            case "003": value = key?.h003
                break
            case "006": value = key?.h006
                break
            case "009": value = key?.h009
                break
            case "012": value = key?.h012
                break
            case "015": value = key?.h015
                break
            case "018": value = key?.h018
                break
            case "021": value = key?.h021
                break
            case "024": value = key?.h024
                break
            default: value = key?.h024
        }
        
        windSpeed = value! as! Double

        windSpeedStr = "\(windSpeed) knots"
        
        return windSpeedStr
    }
    

    
    // "11"
    var asCurrentTemperature: String {
        
        var temperature: Int!
        
        let key = self.forecastModel?.info?.temperatureReal
        
        let value : AnyObject!
        
        switch hourString() {
        case "000": value = key?.h000
            break
        case "003": value = key?.h003
            break
        case "006": value = key?.h006
            break
        case "009": value = key?.h009
            break
        case "012": value = key?.h012
            break
        case "015": value = key?.h015
            break
        case "018": value = key?.h018
            break
        case "021": value = key?.h021
            break
        case "024": value = key?.h024
            break
        default: value = key?.h024
        }
        
        temperature = value! as! Int

        return "\(temperature)"
    }
    
    // "C" or "F"
    var asCurrentUnit: String {
        return "C"
    }
    
    // name contains the location in this object
    var asCurrentLocation: String {
        var locationName : String!
        locationName = self.name
        return locationName
    }
    
}

