//
//  WDLocationManager.swift
//  weather-watch
//
//  Created by Javier Fuchs on 11/2/15.
//  Copyright © 2015 MakingSense. All rights reserved.
//

import Foundation
import CoreLocation


/*
 *  WDLocationManager
 *
 *  Discussion:
 *    Manager of location manager services, the only point in the application where the current location/placement
 *    were informed and saved.
 *    It triggers a kWDLocationUpdated notification telling the new locality/country
 *
 *    Location services only works on iPhone/iPad.
 */

public class WDLocationManager: NSObject, CLLocationManagerDelegate {

    //
    // Attributes only modified by this class
    //
    private var locationManager: CLLocationManager = CLLocationManager()
    private var currentLocation: CLLocation!;
    private var currentPlacemark: CLPlacemark!;

    //
    // Singleton
    //
    class var sharedInstance: WDLocationManager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: WDLocationManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = WDLocationManager()
        }
        return Static.instance!
    }

    //
    // initialization
    //
    private override init() {
        super.init()
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.distanceFilter = kWDMinimumDistanceFilterInMeters
        locationManager.delegate = self
    }
    
    //
    // start location service
    //
    public func start()
    {
        locationManager.startUpdatingLocation()
    }
    
    //
    // stop location service
    //
    public func stop()
    {
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager.stopUpdatingLocation()
        }
    }
    
    //
    // Delegate rules
    //
    @objc public func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let latestLocation: CLLocation = locations.last!
        if (latestLocation != NSNull() && (latestLocation != self.currentLocation))
        {
            CLGeocoder().reverseGeocodeLocation(latestLocation, completionHandler: { (placemarks, error) -> Void in
                if (error == nil)
                {
                    let placemark: CLPlacemark = placemarks!.last!
                    if (placemark != NSNull() && (placemark != self.currentPlacemark))
                    {
                        self.currentPlacemark = placemark;
                        self.currentLocation = latestLocation;
                        
                        let dict: NSDictionary = [kWDKeyLocality: placemark.locality!, kWDKeyCountry: placemark.country!]
                        
                        NSNotificationCenter.defaultCenter().postNotificationName(kWDLocationUpdated, object: dict)
                    }
                }
                // TODO: treat error
            })
            
        }
        
    }
    
    //
    // Delegate rules
    //
    @objc public func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
        if (status == .AuthorizedAlways)
        {
            // TODO: check this
//            self.locationManager.startMonitoringSignificantLocationChanges()
        }
        // TODO: treat other status
        
#if false
        let dict: NSDictionary = [kWDKeyLocality: "Bariloche", kWDKeyCountry: "Argentina"]
        NSNotificationCenter.defaultCenter().postNotificationName(kWDLocationUpdated, object: dict)
#endif
    }


}
