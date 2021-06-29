//
//  ViewController.swift
//  UrlSession
//
//  Created by admin on 19/05/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func onGetTapped(_ sender: UIButton) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else{return}
        let session = URLSession.shared
        session.dataTask(with:url) { (data, response, error) in
            if let response = response{
                print(response)
                
            }
            if let data = data {
                print(data)
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    @IBAction func onPostTapped(_ sender: UIButton) {
        
        let parameters = ["": "", "": ""]
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
    }
}

