//
//  WeatherViewModel.swift
//  weather
//
//  Created by Javier Fuchs on 11/3/15.
//  Copyright © 2015 MakingSense. All rights reserved.
//

import Foundation
import UIKit

class WeatherViewModel : UIView {
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var windImage: UIImageView!

    var forecastResult: WDForecastResult!

    override func awakeAfterUsingCoder(aDecoder: NSCoder) -> AnyObject? {
        if self.subviews.count == 0 {
            return NSBundle.mainBundle().loadNibNamed("WeatherViewModel", owner: nil, options: nil)[0] as! WeatherViewModel
        }
        return self
    }
    
    override func awakeFromNib() {
        self.observeNotification()
    }
    
    private func observeNotification()
    {
        NSNotificationCenter.defaultCenter().addObserverForName(kWDForecastUpdated, object: nil, queue: NSOperationQueue.mainQueue(), usingBlock: {
            note in if let object: WDForecastResult = note.object as? WDForecastResult {
                let weatherImageName = object.asCurrentWeatherImagename
                if let image = UIImage(named: weatherImageName)
                {
                    self.weatherImage.image = image
                }
                self.windImage.image = UIImage(named: object.asCurrentWindDirectionImagename)
                self.windSpeedLabel.text = object.asCurrentWindSpeed
            }})
    }
    
    private func unobserveNotification()
    {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: kWDForecastUpdated, object: nil);
    }
}