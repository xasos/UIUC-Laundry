import Foundation
import UIKit

class MachineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var textArray : NSMutableArray = NSMutableArray()
    
    @IBOutlet var buildingNameLabel: UILabel!
    @IBOutlet weak var washingMachineLabel: UILabel! // # of Washing Machines available
    @IBOutlet weak var dryerLabel: UILabel! // # of dryers available
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let laundry = LaundryInformation().getLaundryInformation()
        self.textArray.addObject("")
        self.textArray.addObject("")
        self.textArray.addObject("")
        self.textArray.addObject("")
        self.textArray.addObject("")
        self.textArray.addObject("")
        self.textArray.addObject("")
        self.textArray.addObject("")
        self.textArray.addObject("")
        self.textArray.addObject("")
        
        self.tableView.rowHeight = 105.0
        self.tableView.estimatedRowHeight = 105.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.textArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = self.textArray.objectAtIndex(indexPath.row) as! String
        return cell
    }
    
    
}

