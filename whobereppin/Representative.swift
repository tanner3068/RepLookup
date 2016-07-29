//
//  Representative.swift
//  whobereppin
//
//  Created by Taylor Mott on 9/17/15.
//  Copyright © 2015 Mott Applications. All rights reserved.
//

import Foundation

class Representative: NSObject {
    
    var name: String?
    var party: String?
    var state: String?
    var district: String?
    var phone: String?
    var office: String?
    var link: String?
    
    
    init(dictionary : [String: String]) {
            self.name = dictionary["name"]
            self.party = dictionary["party"]
            self.state = dictionary["state"]
            self.district = dictionary["district"]
            self.phone = dictionary["phone"]
            self.office = dictionary["office"]
            self.link = dictionary["link"]
    }
}
