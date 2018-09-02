# iOS-Weather-App
A very basic but still smexy weather app.

![alt](./WeatherAppDemoGIF.gif)
# Before you do anything...
This app requires a few things to set up before you're good to go.

First, make sure you have cocoapods installed.  If you don't, then click [here](https://cocoapods.org/) and follow their sorta-simple instructions (actually they're pretty straightforward).

Second—with Cocoapods installed—type `pod init` in the terminal in the WeatherApp directory, and add the following to your Podfile:  
`pod 'Alamofire'`\
 `pod 'SwiftyJSON'`\
 `pod 'NVActivityIndicatorView'`    
 Then type `pod install`  
 Once that's done, work from the .xcworkspace file from now on (do not use the .xcodeproj anymore). 
 # Heads up
You might get a warning which says something like "update to recommended build settings" or something like that.  Just click it and say yes.  This happens because Cocoapods adds new files (aka pods) to your Framework while Xcode might not be aware of them.  
If you have any errors claiming that your import statements are invalid, then doing Product -> Build from the toolbar should take care of it.  
If not, then try Product -> Clean, and then do Product -> Build.
And finally, you'll need an API key in order to request weather data.  If you don't have one, then visit [the Open Weather Map API](https://openweathermap.org/api).  Let me know if you have trouble figuring this out.

# And that's it.
Let me know if you're having any issues.  Enjoy.
