//
//  ViewController.swift
//  JsonPost_Demo
//
//  Created by admin on 25/05/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textUID: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtBody: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPostClicked(_ sender: UIButton) {
        self.setUpPostMethod()
    }
    
}

extension ViewController {
    func setUpPostMethod(){
        guard let uid = self.textUID.text else {return}
        guard let title = self.txtTitle.text else {return}
        guard let body = self.txtBody.text else {return}
        
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts/"){
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
//            let parameter: [String : Any] = [
//                "userId":uid,
//                "title":title,
//                "body":body
//            ]
//            request.httpBody = parameter.percentEscaped().data(using: .utf8)
            
            URLSession.shared.dataTask(with: request) { (data, response, error ) in
                guard let data = data else {
                    if error == nil {
                        print(error?.localizedDescription ?? "Unkown Error")
                    }
                    return
                }
                if let response = response as? HTTPURLResponse {
                    guard (200 ... 299) ~= response.statusCode else {
                        print("status code :-\(response.statusCode)")
                        return
                    }
                }
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch let error{
                    print(error.localizedDescription)
                }
            }.resume()
        }
    }
}

extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
            
            
        }
        .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}

