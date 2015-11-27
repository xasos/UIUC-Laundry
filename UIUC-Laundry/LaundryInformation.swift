import Foundation
import Alamofire
import SwiftyJSON

var serverURL = "http://localhost:5000/laundry"

class LaundryInformation {

    func getLaundryInformation() -> SwiftyJSON.JSON {
            Alamofire.request(.GET, serverURL).validate().responseJSON { response in
            switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        return json
                    }
                case .Failure(let error):
                    print(error)
                    return
                }
            }
    }
    
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String:AnyObject]
                return json
            } catch {
                print("Something went wrong")
            }
        }
        return nil
    }
}

