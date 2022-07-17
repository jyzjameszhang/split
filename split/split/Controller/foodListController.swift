//
//  foodListController.swift
//  split
//
//  Created by Collin Qian on 7/10/22.
//

import UIKit

class foodListController: UIViewController, UITableViewDelegate, UITableViewDataSource, foodTableCellDelegate {
    func didTapButton(with title: String) {
        print ("\(title)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: foodTableCell.identifier, for: indexPath) as! foodTableCell
        cell.configure(with: personArr[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    @IBOutlet weak var foodTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodTable.register(foodTableCell.nib(), forCellReuseIdentifier: foodTableCell.identifier)
        foodTable.delegate = self
        foodTable.dataSource = self
        
        var i = 0
        for (_, person) in personDic{
            personArr.append(person.name)
            i += 1
        }
        
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
