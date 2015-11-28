import Foundation
import Alamofire
import SwiftyJSON

var serverURL = "http://localhost:5000/laundry"

class LaundryInformation {
    func getLaundryInformation() {
        Alamofire.request(.GET, serverURL).validate().responseJSON { response in
            switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                    }
                case .Failure(let error):
                    print(error)
                    return
                }
        }
    }
}

