//
//  ViewController.swift
//  split
//
//  Created by James Zhang on 7/8/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var button:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.backgroundColor = .systemGreen
        button.setTitle("Take picture of receipt", for: .normal)
        button.setTitleColor(.white, for: .normal)
    }

    @IBAction func didTapButton(){
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated:true)
    }

}

extension ViewController: UIImagePickerControllerDelegate, 
    UINavigationControllerDelegate{
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
            picker.dismiss(animated: true, completion: nil)
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
            picker.dismiss(animated:true, completion: nil)
            guard let image = info[UIImagePickerController.InfoKey.originalImage] as?
                UIImage else{
                    return
            }
            imageView.image = image
        }
    }
