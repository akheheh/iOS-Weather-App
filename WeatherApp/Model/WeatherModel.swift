//
//  WeatherModel.swift
//  PodApp
//
//  Created by alex heidarian on 9/1/18.
//  Copyright © 2018 alex heidarian. All rights reserved.
//Weather model for fetching and parsing data.

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

//Parse the retrieved JSON data—extract the temperature and send it to the desired label (tempLabel in this case)
func parseData(data: JSON, label: UILabel) {
    let tempResult = data["main"]["temp"].double;
    if let valid = tempResult {
        label.text = String(Int(valid)) + "°";
    }
}

//Go and retrieve the data from the desired URL.
func getWeather(url: String, city: UILabel, temp: UILabel) {
    Alamofire.request(url).responseJSON {response in
        //If the data is valid JSON, do stuff
        if let fetchedData : JSON = JSON(response.result.value) {
            //Print the JSON data to console for debugging purposes.
            print(fetchedData);
            //If there's no error message, parse the JSON data.
            if(fetchedData["message"] == JSON.null) {
                parseData(data: fetchedData, label: temp);
            }
            //If there's an error, let the user know.
            else {
                //Scale font size in city label to accomodate more characters.
                city.adjustsFontSizeToFitWidth = true;
                city.text = "City does not seem to exist.\nTry again."
                temp.text = "??°";
            }
        }
        
    }
}
