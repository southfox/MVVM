//
//  ViewController.swift
//  weather-watch
//
//  Created by Javier Fuchs on 11/3/15.
//  Copyright © 2015 MakingSense. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toolbarView: UIView!
    @IBOutlet weak var horizontalSlider: UISlider!
    @IBOutlet weak var hourLabel: UILabel!
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var windImage: UIImageView!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    
    
    var forecastResult: WDForecastResult!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.observeNotification()
        
        self.hideWeatherInfo()
        
        if self.forecastResult != nil
        {
            self.updateForecastView()
        }

    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.unobserveNotification()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func updateForecastView()
    {
        if self.forecastResult != nil
        {
            let weatherImageName = self.forecastResult.asCurrentWeatherImagename
            let image = UIImage(named: weatherImageName)
            self.weatherImage.image = image
            self.windImage.image = UIImage(named: self.forecastResult.asCurrentWindDirectionImagename)
            self.temperatureLabel.text = self.forecastResult.asCurrentTemperature
            self.unitLabel.text = self.forecastResult.asCurrentUnit
            self.locationLabel.text = self.forecastResult.asCurrentLocation
            self.windSpeedLabel.text = self.forecastResult.asCurrentWindSpeed
            self.hourLabel.text = self.forecastResult.asHourString
            
            self.showWeatherInfo()
        }
        
    }
    
    
    private func observeNotification()
    {
        NSNotificationCenter.defaultCenter().addObserverForName(kWDForecastUpdated, object: nil, queue: NSOperationQueue.mainQueue(), usingBlock: {
            [weak self] note in if let object: WDForecastResult = note.object as? WDForecastResult {
                if let strongself = self
                {
                    strongself.forecastResult = object
                    strongself.updateForecastView()
                }
            }})
    }
    
    private func unobserveNotification()
    {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: kWDForecastUpdated, object: nil);
        
    }
    
    private func hideWeatherInfo()
    {
        self.toolbarView.alpha = 0
        self.topView.alpha = 0
        self.middleView.alpha = 0
        self.bottomView.alpha = 0
    }
    
    private func showWeatherInfo()
    {
        UIView.animateWithDuration(kWDAnimationDuration) { [weak self] () -> Void in
            if let strongself = self
            {
                strongself.toolbarView.alpha = 1
                strongself.topView.alpha = 1
                strongself.middleView.alpha = 1
                strongself.bottomView.alpha = 1
            }
        }
    }


}

