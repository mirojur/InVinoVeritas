//
//  VinoViewController.swift
//  InVinoVeritas
//
//  Created by Miroslav Juric on 11.08.17.
//  Copyright © 2017 Miroslav Juric. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class VinoViewController: UIViewController {
    
    var ref: FIRDatabaseReference!
    
    @IBAction func addNewVino(_ sender: Any) {
        
        let userID = FIRAuth.auth()?.currentUser?.uid
        
        let key = ref.child("wines").childByAutoId().key
        let wines = ["uid": userID,
                     "wine name": "Chainti 1",
                     "land": "Italia",
                     "description": "description"]
        let childUpdates = ["/wines/\(key)": wines]
        ref.updateChildValues(childUpdates)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
        ref = FIRDatabase.database().reference(fromURL: "https://invinoveritas-218b8.firebaseio.com/")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
