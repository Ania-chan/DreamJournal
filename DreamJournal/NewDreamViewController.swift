//
//  NewDreamViewController.swift
//  DreamJournal
//
//  Created by Anna Nakayama on 2019/05/28.
//  Copyright © 2019 Anna Nakayama. All rights reserved.
//

import UIKit
import os.log

class NewDreamViewController: UIViewController, UITextViewDelegate {
    
    //MARK: Output
    @IBOutlet weak var dreamText: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                    // Hide the keyboard.
                    textField.resignFirstResponder()
                    return true
                }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dreamText.becomeFirstResponder()
    }
}

//extension NewDreamViewController: UITextViewDelegate {
//    
//    func textFieldShouldReturn(_ textField: UITextView) -> Bool {
//        textField.resignFirstResponder()
//        return false
//    }
//    
//}

    
//    var dream: DreamItem?
    
    //MARK: Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//
//        guard let button = sender as? UIBarButtonItem, button === saveButton else {
//            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
//            return
//        }
//        let dreamInput = dreamText.text ?? ""
//        dream = DreamItem()
//    }







    //MARK: Actions
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        // Hide the keyboard.
//        textField.resignFirstResponder()
//        return true
//    }
//
//
//}
//
//extension NewDreamViewController: UITextViewDelegate {
//
//    func textFieldShouldReturn(_ dreamText: UITextView) -> Bool {
//        dreamText.resignFirstResponder()
//        return false
//    }
//
//}
