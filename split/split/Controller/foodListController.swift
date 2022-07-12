//
//  foodListController.swift
//  split
//
//  Created by Collin Qian on 7/10/22.
//

import UIKit

class foodListController: UIViewController {
    @IBOutlet weak var foodSwitch: UISwitch!
    @IBOutlet weak var foodTable: UITableView!
    
    
    @IBAction func confirmFoods(_ sender: UIButton) {
        if (foodSwitch.isOn) {
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
