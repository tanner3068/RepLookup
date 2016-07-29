//
//  NetworkController.swift
//  whobereppin
//
//  Created by Taylor Mott on 9/17/15.
//  Copyright © 2015 Mott Applications. All rights reserved.
//

import Foundation

class NetworkController: NSObject {
    
    static func searchRepsByState(state: String, completion: (representatives: [Representative]) -> Void) {
                
//        let UrlStringRep = "http://whoismyrepresentative.com/getall_reps_bystate.php?state=\(state)&output=json"
        
        
        let urlRep = NSURL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php?state=\(state)&output=json")!
        
        let dataTaskRep = NSURLSession.sharedSession().dataTaskWithURL(urlRep) { (data, response, error) in
            
            if let data = data {
                do {
                    let mainResults = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
//                    print("Results for Reps: \(mainResults)")
                    
                    print("\(mainResults)")
                    
                    let representativeDictionaries = mainResults["results"] as! [[String: String]]
                    
                    print(representativeDictionaries.count)
                    print("\(representativeDictionaries)")
                    
                    var arrayOfModelRepresentatives: [Representative] = []
                    
                    
                    for dictionary in representativeDictionaries {
                        
                        let rep = Representative(dictionary: dictionary)
                        
                        arrayOfModelRepresentatives.append(rep)
                    }
                    
                    completion(representatives: arrayOfModelRepresentatives)
                } catch {
                    print("ERROR")
                    completion(representatives: [])
                }
            } else {
                completion(representatives: [])
            }
        }
        dataTaskRep.resume()
        
    }
    
    static func searchSenatorsByState(state: String, completion: (senators: [Senator]) -> Void) {
        
     
        let UrlStringSenator = "http://whoismyrepresentative.com/getall_sens_bystate.php?state=\(state)&output=json"
        
        
          let urlSenator = NSURL(string: UrlStringSenator)!
        
        
        let dataTaskSenator = NSURLSession.sharedSession().dataTaskWithURL(urlSenator) { (data, respose, error) in
            
            if let data = data {
                do {
                    
                    
                    let mainResults = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
                    
                    
//                    print("Results of Senators: \(mainResults)")
                    
                    let representativeDictionaries = mainResults["results"] as! [[String: String]]
                    
                    var arrayOfModelSenators: [Senator] = []
                    
                    
                    for dictionary in representativeDictionaries {
                        
                        let senator = Senator(dictionary: dictionary)
                        
                        arrayOfModelSenators.append(senator)
                    }
                    
                    completion(senators: arrayOfModelSenators)
                } catch {
                    print("ERROR")
                    completion(senators: [])
                }
            } else {
                completion(senators: [])
            }
        }

        
        dataTaskSenator.resume()
    }
    
    
    
}
