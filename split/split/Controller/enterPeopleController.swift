//
//  enterPeople.swift
//  split
//
//  Created by Collin Qian on 7/10/22.
//

import UIKit

class enterPeopleController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var enterNames: UITextField!
    @IBOutlet weak var displayNames: UITextView!
    @IBOutlet weak var errorMessage: UILabel!
    
    
    @IBAction func addPerson(_ sender: UIButton) {
        if (enterNames.text == "") {
            var errorEmptyName : String
            errorEmptyName = "Please Enter A Name"
            errorMessage.text = errorEmptyName
        }
        else {
            if (errorMessage.text != "") {
                errorMessage.text = ""
            }
            var tempText : String
            tempText = enterNames.text!
            tempText += "\n"
            enterNames.text = ""
            displayNames.text += tempText
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
