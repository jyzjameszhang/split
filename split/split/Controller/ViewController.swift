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
        picker.sourceType = .photoLibrary
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
            var imageData = (image).jpegData(compressionQuality: 1)
            if imageData == nil{
                return
            }
            let param = [
                "client_id"  : "TEST",
                "recognizer"    : "auto",
            ]
            let boundary = generateBoundaryString()
            let imgKey = "name"
            let apiURL = URL(string:"https://ocr.asprise.com/api/v1/receipt")
            let request = NSMutableURLRequest(url:apiURL! as URL)
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = createBodyWithParameters(parameters: param, filePathKey: "file", imageDataKey: imageData! as NSData, boundary: boundary, imgKey: imgKey) as Data
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in

                if error != nil {
                    print("error=\(error!)")
                    return
                }

                //print response
                //print("response = \(response!)")

                // print reponse body
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("response data = \(responseString!)")

            }

        task.resume()
        }
        func createBodyWithParameters(parameters: [String: String]?, filePathKey: String?, imageDataKey: NSData, boundary: String, imgKey: String) -> NSData {
            let body = NSMutableData();

            if parameters != nil {
                for (key, value) in parameters! {
                    body.appendString(string: "--\(boundary)\r\n")
                    body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                    body.appendString(string: "\(value)\r\n")
                }
            }
            let filename = "\(imgKey).jpg"
            let mimetype = "image/jpg"

            body.appendString(string: "--\(boundary)\r\n")
            body.appendString(string: "Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
            body.appendString(string: "Content-Type: \(mimetype)\r\n\r\n")
            body.append(imageDataKey as Data)
            body.appendString(string: "\r\n")
            body.appendString(string: "--\(boundary)--\r\n")

            return body
        }

        func generateBoundaryString() -> String {
            return "Boundary-\(NSUUID().uuidString)"
        }

     }
extension NSMutableData {
    func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}
