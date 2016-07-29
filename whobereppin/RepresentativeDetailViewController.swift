//
//  RepresentativeDetailViewController.swift
//  whobereppin
//
//  Created by Taylor Mott on 9/16/15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

import UIKit

class RepresentativeDetailViewController: UIViewController {
    @IBOutlet weak var repNameLabel: UILabel!

    @IBOutlet weak var stateNameLabel: UILabel!
    
    @IBOutlet weak var districtNameLabel: UILabel!
    
    @IBOutlet weak var partyNameLabel: UILabel!
    
    @IBOutlet weak var linkNameLabel: UILabel!
    
    @IBOutlet weak var phoneNameLabel: UILabel!
    
    var rep: Representative?
    var sen: Senator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let rep = rep {
            
            self.repNameLabel.text = rep.name
            self.stateNameLabel.text = rep.state
            self.districtNameLabel.text = rep.district
            self.partyNameLabel.text = rep.party
            self.linkNameLabel.text = rep.link
            self.phoneNameLabel.text = rep.phone

        }else {
            if let sen = sen {
                
                self.repNameLabel.text = sen.name
                self.stateNameLabel.text = sen.state
                self.districtNameLabel.text = sen.district
                self.partyNameLabel.text = sen.party
                self.linkNameLabel.text = sen.link
                self.phoneNameLabel.text = sen.phone
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
