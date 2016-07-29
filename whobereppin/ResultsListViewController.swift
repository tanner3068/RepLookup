//
//  ResultsListViewController.swift
//  whobereppin
//
//  Created by Taylor Mott on 9/16/15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

import UIKit

class ResultsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var repsArray: [Representative] = []
    var senatorsArray: [Senator] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "repTapped" {
            if let sender = sender {
                let cell = sender as! UITableViewCell
                let indexPath = self.tableView.indexPathForCell(cell)!
                
                if senatorsArray.count == 0 {
                   
                    let rep = self.repsArray[indexPath.row]
                    let detailViewController = segue.destinationViewController as! RepresentativeDetailViewController
                    detailViewController.rep = rep
                    
                }else{
                    
                    let sen = self.senatorsArray[indexPath.row]
                    let detailViewController = segue.destinationViewController as! RepresentativeDetailViewController
                    detailViewController.sen = sen
                }
                
               
            }
        }
        
        
    }


}

extension ResultsListViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if self.senatorsArray.count == 0 {
            
            return self.repsArray.count

        }else{
            
        return self.senatorsArray.count
        
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID", forIndexPath: indexPath)
        
        if self.senatorsArray.count == 0 {
             let rep = self.repsArray[indexPath.row]
            if let name = rep.name, party = rep.party {
                cell.textLabel?.text = name
                cell.detailTextLabel?.text = party
            }
        } else {
            let sen = self.senatorsArray[indexPath.row]
            if let name = sen.name, party = sen.party{
                cell.textLabel?.text = name
                cell.detailTextLabel?.text = party
                
            }
        }
        
       
        
        
    
        return cell
    }
    
    
    
    
    
}

