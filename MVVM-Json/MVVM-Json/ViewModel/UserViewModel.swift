import Foundation
import Alamofire

class UserViewModel {
    
    weak var vc: ViewController?
    var arrUsers = [UserModel]()
    
    func getAllUserDataAF(){
        AF.request("https://jsonplaceholder.typicode.com/todos/").response {
            response in
            if let data = response.data {
                do{
                    let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                    self.arrUsers.append(contentsOf: userResponse)
                    DispatchQueue.main.async {
                        self.vc?.tblView.reloadData()
                    }
                    
                }catch let error {
                    print(error.localizedDescription)
                }
            
        }
    }
 
    }
    
    func getAllUserData(){
        URLSession.shared.dataTask(with: URL(string:"https://jsonplaceholder.typicode.com/todos/")!){ [self](data, resp,error) in
            if error == nil{
                if let data = data {
                    do{
                        let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                        self.arrUsers.append(contentsOf: userResponse)
                        DispatchQueue.main.async {
                            vc?.tblView.reloadData()
                        }
                       
                    }catch let error {
                        print(error.localizedDescription)
                    }
                }
            }else{
                print(error?.localizedDescription)
            }
        }.resume()
    }
        
}
