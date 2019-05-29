//
//  NewDreamViewController.swift
//  DreamJournal
//
//  Created by Anna Nakayama on 2019/05/28.
//  Copyright © 2019 Anna Nakayama. All rights reserved.
//

import UIKit

class NewDreamViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
//    var dreamList: DreamsList
    @IBOutlet weak var dreamTitle: UITextField!
    @IBOutlet weak var dreamText: UITextView!
    
//    @IBAction func addDream(_ sender: Any) {
//        let newRowIndex = dreamList.dreams.count
//        _ = dreamList.addDream()
//        
//        let indexPath = IndexPath(row: newRowIndex, section: 0)
//        let indexPaths = [indexPath]
//        tableView.insertRows(at: indexPaths, with: .automatic)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dreamTitle.delegate = self
        dreamText.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    

}
