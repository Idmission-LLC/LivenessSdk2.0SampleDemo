//
//  Extensions.swift
//  IdentityMedium 2.0
//
//  Created by Amol Deshmukh on 27/01/22.
//

import UIKit
import Foundation
import IDentityLivenessSDK
import SelfieCaptureLiveness

// MARK:  Reused Methods
extension UIViewController {
    
    func getBoolValue(str:String) -> Bool? {
        if str == "true" || str == "TRUE" {
            return true
        } else if str == "false" || str == "FALSE" {
            return false
        } else {
            return nil
        }
    }
}

extension UILabel {
    func retriveLabelHeight() -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = self.font
        label.text = self.text

        label.sizeToFit()
        return label.frame.height
    }

}


extension UIView {
    
    func getViewsAspectRatioHeight(image:UIImage, viewWidth:CGFloat) -> CGFloat {
        
        let myImageWidth = image.size.width
        let myImageHeight = image.size.height
        
        let ratio = viewWidth/myImageWidth
        let scaledHeight = myImageHeight * ratio
        
        return scaledHeight
    }
    
    func utcToLocal(dateValue: Date?) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        if let date = dateValue {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "dd/MM/yyyy"
        
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    func getImageFrom(base64String:String?) -> UIImage? {
        if let processedIdImageBase64String = base64String {
            if let processedIdImageData = Data(base64Encoded: processedIdImageBase64String){
                if let processedResultIdImage = UIImage(data: processedIdImageData){
                    return processedResultIdImage
                }
            } else if let Dict = getDictinaryFromJSONString(jsonString: processedIdImageBase64String) {
                if let base64String = Dict["fileContent"] as? String, base64String != "" {
                    return getImageFrom(base64String: base64String)
                }
            }
        }
        
        return nil
    }

    func getDictinaryFromJSONString(jsonString:String?) -> Dictionary<String, Any>? {
        if let data = jsonString?.data(using: .utf8) {
            do {
                let myJson = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as Any
                
                if let dict = myJson as? [String: Any] {
                    return dict
                    
                }
                
            } catch let error {
                print(error)
            }
        }
        
        return nil
    }

}

extension String {
    var parseJSONString: AnyObject?
    {
        let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        if let jsonData = data
        {
            // Will return an object or nil if JSON decoding fails
            do
            {
                let message = try JSONSerialization.jsonObject(with: jsonData, options:.mutableContainers)
                if let jsonResult = message as? NSMutableArray
                {
                    print(jsonResult[0])
                    
                    return jsonResult[0] as AnyObject //Will return the json array output
                }
                else
                {
                    return nil
                }
            }
            catch let error as NSError
            {
                print("An error occurred: \(error)")
                return nil
            }
        }
        else
        {
            // Lossless conversion of the string was not possible
            return nil
        }
    }
    
    func parse<D>(to type: D.Type) -> D? where D: Decodable {

        let data: Data = self.data(using: .utf8)!
        let decoder = JSONDecoder()
        do {
            let _object = try decoder.decode(type, from: data)
            return _object

        } catch {
            return nil
        }
    }

}

class TimerModel: NSObject {
    static let sharedTimer: TimerModel = {
        let timer = TimerModel()
        return timer
    }()

    var internalTimer: Timer?
    var counter : Int = 0

    func startTimer() {
        if internalTimer == nil {
            internalTimer?.invalidate()
        }
        internalTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(doJob), userInfo: nil, repeats: true)
    }

    func stopTimer() {
        guard internalTimer != nil else {
            print("No timer active, start the timer before you stop it.")
            return
        }
        counter = 0
        internalTimer?.invalidate()
    }

    @objc func doJob() {
        counter = counter + 1
    }

}
