import Foundation
import UIKit
import SwiftyJSON
import Alamofire

class MachineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var textArray : NSMutableArray = NSMutableArray()
    
    var laundryRoomCount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let laundry = LaundryInformation().getLaundryInformation()
        
        Alamofire.request(.GET, "http://23.23.147.128/homes/mydata/urba7723").validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
//                    
                    print("JSON: \(json)")
                    
                    self.laundryRoomCount = json["location"]["rooms"].count
                    print(json["location"]["count"][0])
                }
            case .Failure(let error):
                print(error)
            }
        }
        
        for _ in 1...30 {
            self.textArray.addObject("")
        }
        
        self.tableView.rowHeight = 105.0
        self.tableView.estimatedRowHeight = 105.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30 // Replace with laundry room count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: MachineTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as! MachineTableViewCell
        cell.buildingNameLabel?.text = "lol"
        cell.washingMachineLabel?.text = "nah"
        cell.dryerLabel?.text = "pls"
        
        return cell
    }
    
    
}

