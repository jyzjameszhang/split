//
//  foodListController.swift
//  split
//
//  Created by Collin Qian on 7/10/22.
//

import UIKit

class foodListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = foodArr[indexPath.row].name
        return cell
    }
    
    @IBOutlet weak var foodTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        foodTable.delegate = self
        foodTable.dataSource = self
        
    }
    
    @IBAction func confirmFoods(_ sender: UIButton) {
        //if (foodSwitch.isOn) {
            
        //}
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
