//
//  WDFacade.swift
//  weather-watch
//
//  Created by Javier Fuchs on 11/2/15.
//  Copyright © 2015 MakingSense. All rights reserved.
//

import Foundation

/*
 *  WDFacade
 *
 *  Discussion:
 *    Manager of synchronization between the watch/iphone/ipad it shares plist files using a common group.
 *    It is subscribed to notifications of the LocationManager to update the plist file with the new location/country.
 */


public class WDFacade: NSObject, WDForecastWeatherDelegate {

    //
    // Attributes only modified by this class
    //
    private var currentLocality: String!;
    private var currentCountry: String!;
    private var forecast: WDForecastWeather!;

    //
    // Singleton
    //
    class var sharedInstance: WDFacade {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: WDFacade? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = WDFacade()
        }
        return Static.instance!
    }
    
    //
    // initialization
    //
    private override init() {
        super.init()
        self.forecast = WDForecastWeather()
        self.forecast.delegate = self
    }


    //
    // start service manager
    //
    public func start()
    {
        self.startLocationServices()
        self.startForecastServices()
    }
    
    //
    // stop service manager
    //
    public func stop()
    {
        self.stopLocationServices()
        self.stopForecastServices()
    }

    
    //
    // restore information (used by watch)
    //
    public func restoreInfo() -> Bool
    {
        let filePath = absoluteFilePath()
        
        if NSFileManager.defaultManager().fileExistsAtPath(filePath.path!) {
            
            let dict = NSDictionary(contentsOfURL: filePath) as! Dictionary<String, NSDictionary>

            let location : NSDictionary = dict[kWDLocationUpdated]!
            if (location != NSNull())
            {
                // Treat location update
                
                let locality : String = String(location[kWDKeyLocality]!)
                let country : String = String(location[kWDKeyCountry]!)

                print("locality = \(locality), country = \(country)")
                self.updateLocationInfo(locality, country: country)
                return true
            }
        } else {
            print("No last location")
        }
        return false
    }
    
    //
    // Location code
    //
    private func startLocationServices()
    {
        NSNotificationCenter.defaultCenter().addObserverForName(kWDLocationUpdated, object: nil, queue: NSOperationQueue.mainQueue(), usingBlock: {
            note in if let object: NSDictionary = note.object as? NSDictionary {
                if (TARGET_OS_WATCH == 1)
                {
                    if self.restoreInfo()
                    {
                        self.updateForecast()
                    }
                }
                else
                {
                    self.writeNote(kWDLocationUpdated, location: object)
                }
            }})
        
    }
    
    private func stopLocationServices()
    {        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: kWDLocationUpdated, object: nil);
    }

    
    public func updateLocationInfo(locality: String, country: String)
    {
        self.currentLocality = locality
        self.currentCountry = country
    }
    
    public func getCurrentLocation() -> String
    {
        return self.currentLocality
    }

    //
    // Return the absolute file path of the group
    //
    private func absoluteFilePath() -> NSURL
    {
    #if false
        let url = NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier(kWDGroup)
        if (!url) {
            return nil
        }
        let filePath = url!.URLByAppendingPathComponent(kWDWatchPlist)
    #else
        let url = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0])
        let filePath = url.URLByAppendingPathComponent(kWDWatchPlist)
    #endif
        if (TARGET_OS_WATCH == 1)
        {
            print("Watch")
        }
        else
        {
            print("iPhone/iPad")
        }
        print(filePath)
        return filePath;
    }
    
    //
    // Write the file
    //
    private func writeNote(note: String, location: NSDictionary)
    {
        let filePath = absoluteFilePath()
        let dict: NSDictionary = [note : location]
        if dict.writeToURL(filePath, atomically: true) {
        }
    }
    
    
    //
    // Forecast group of code
    //
    private func startForecastServices()
    {
        
        if self.restoreInfo()
        {
            self.updateForecast()
        }
    }
    
    private func stopForecastServices()
    {
        self.forecast.delegate = nil
    }
    
    private func updateForecast()
    {
        self.forecast.queryLocation(self.getCurrentLocation())
    }
    
    //
    // forecast protocol
    //
    func forecast(manager: WDForecastWeather, didUpdateSpotResult success: Bool, spotResult: WDSpotResult) {
        if (success)
        {
            if let spot : WDSpot = spotResult.spots?.last
            {
                self.forecast.queryWeatherInfo(spot.identity!)
            }
        }
    }

    func forecast(manager: WDForecastWeather, didUpdateForecastResult success: Bool, forecastResult: WDForecastResult) {
        if (success)
        {
            NSNotificationCenter.defaultCenter().postNotificationName(kWDForecastUpdated, object: forecastResult)
        }
    }
    
    func forecast(manager: WDForecastWeather, updateForecastDidFailWithError error: NSError) {
        print("error = \(error)")
    }
    
    func forecast(manager: WDForecastWeather, updateSpotDidFailWithError error: NSError) {
        print("error = \(error)")
    }
    

}
