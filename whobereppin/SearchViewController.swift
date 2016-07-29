//
//  SearchViewController.swift
//  whobereppin
//
//  Created by Taylor Mott on 9/16/15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var represenativeSegue = "representativeSegue"
    var senatorSegue = "senatorSegue"
    
    
    var resultsReps: [Representative] = []
    var resultsSenators: [Senator] = []
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    //MARK: - Properties
    var states = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    
    //MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NetworkController.searchRepsByState("CA") { (representatives) in
//            
////             print("made it to print ( A reps)")
////             print(representatives)
////             print("made it to print ( B reps)")
//            
//            NetworkController.searchSenatorsByState("CA") { (senators) in
////              print("senators are here \(senators)")
//        }
//      }
    }
    
    @IBAction func searchButtonTapped(sender: UIButton) {
        
        let index = self.pickerView.selectedRowInComponent(0)
        let stateString = self.states[index]
        
      
        
        NetworkController.searchRepsByState(stateString) { (representativesdudes) in
            if representativesdudes.count > 0 {
                self.resultsReps = representativesdudes
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.performSegueWithIdentifier("representativeSegue", sender: sender)
                })
                
            } else {
                print("There was an error searching for reps")
            }
        }
        
    }
    
    
    @IBAction func searchSenatorsButtonTapped(sender: AnyObject) {
        
        let index = self.pickerView.selectedRowInComponent(0)
        let stateString = self.states[index]
        
        NetworkController.searchSenatorsByState(stateString) { (senatorsguys) in
            if senatorsguys.count > 0 {
                self.resultsSenators  = senatorsguys
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.performSegueWithIdentifier("senatorSegue", sender: sender)
                })
                
            } else {
                print("There was an error searching for senators")
            }
        }

        
    }
   
    
    
    // MARK: - Navigation
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == represenativeSegue {
            
            let resultsListViewController = segue.destinationViewController as! ResultsListViewController
            
           resultsListViewController.repsArray = self.resultsReps
            
        }else {
            
            let resultsListViewController = segue.destinationViewController as! ResultsListViewController
            resultsListViewController.senatorsArray = self.resultsSenators
            
            
        }
        
}

}

//MARK: - UIPickerViewDataSource Methods
extension SearchViewController: UIPickerViewDataSource {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
        
    }
    
}

extension SearchViewController: UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return states[row]
    }
    
}


