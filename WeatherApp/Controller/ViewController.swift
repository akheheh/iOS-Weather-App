//
//  ViewController.swift
//  PodApp
//
//  Created by alex heidarian on 8/26/18.
//  Copyright © 2018 alex heidarian. All rights reserved.
//

import UIKit
//import module for loading icons
import NVActivityIndicatorView

class ViewController: UIViewController, UITextFieldDelegate {
    //UILabel for City title name
    @IBOutlet weak var cityLabel: UILabel!
    //UILabel for the temperature of desired city
    @IBOutlet weak var tempLabel: UILabel!
    //user input to specify desired city
    @IBOutlet weak var userInput: UITextField!
    //The rotating sun icon
    @IBOutlet weak var sun: UIImageView!
    //Loading icon
    @IBOutlet weak var loadingIcon: NVActivityIndicatorView!
    
    //You'll have to create your own api key.  Visit openweathermap.org/api to register for a free key.
    var APIKey = "You'll have to make your own.  View README for instructions."

    //Things to do when user hits the "go" key on keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userInput.resignFirstResponder()
        
        //%20 represents the spacebar character in the url i.e "San Francisco" would read as "San%20Francisco" in the url.
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(userInput.text!.replacingOccurrences(of: " ", with: "%20")),us&units=imperial&appid=\(APIKey)";
        
        //Once user submits input, notify the user that app is fetching the temperature
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            //begin animating the loading icon
            self.loadingIcon.startAnimating();
            self.cityLabel.text = "Searching..."
        }
        
        //Basically, hide the temp label until loading is finished
        self.tempLabel.text = ""
        //What to do when loading is over.
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.75) {
            //Stop animating the loading icon
            self.loadingIcon.stopAnimating();
            
            //If the desired city is a valid city in the US, then parse and display the temperature.
            if let validCity = self.userInput.text {
                //Call the weather model
                getWeather(url: url, city: self.cityLabel, temp: self.tempLabel);
                //Re-render the city label text to the desired city.
                self.cityLabel.text = validCity;
            }
            //clear text in input field in order to prep the app for repeated use.
            self.userInput.text = nil;
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        //Underline the user input field.
        userInput.underlined();
        //Select the ballScaleRippleMultiple loading icon.
        loadingIcon.type = .ballScaleRippleMultiple
        
        //Set the background of app to the specified gradient (see Controller/Extensions/colors.swift in order to add your own colors.)
        view.setGradientBackground(col1: Colors.dBlue, col2: Colors.lBlue)

        //Animate the sun icon.
        UIView.animate(withDuration: 5, delay: 0, options: [UIViewAnimationOptions.curveEaseOut,UIViewAnimationOptions.autoreverse ,UIViewAnimationOptions.repeat], animations: {
            self.sun.transform = CGAffineTransform(rotationAngle: -1 * .pi);
        }, completion: nil)
        
        //Change the "return" key type to show "Go".
        userInput.returnKeyType = .go;
        
        //Let the API know that the userInput will recieve any data it finds.
        userInput.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

