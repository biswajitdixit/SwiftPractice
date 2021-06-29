import Firebase
import FirebaseFirestoreSwift

struct User:Codable,Equatable {
    var id = ""
    var userName: String
    var email: String
    var ImageLink = ""
    var status: String
    
    static var currentId: String {
        return Auth.auth().currentUser!.uid
    }
    
    static var currentUser: User? {
        if Auth.auth().currentUser != nil {
            if let dictionary = UserDefaults.standard.data(forKey: CURRENTUSER){
                
                let decoder = JSONDecoder()
                do{
                    let userObj = try decoder.decode(User.self, from: dictionary)
                    return userObj
                }catch {
                    print("Error decoding user from userdefaults")
                }
            }
        }
        return nil
    }
    static func == (lhs: User, rhs:User) -> Bool {
        lhs.id == rhs.id
    }
    
}

func saveUserLocally(_ user:User){
    
    let encoder = JSONEncoder()
    do {
        let data = try encoder.encode(user)
        UserDefaults.standard.set(data, forKey: CURRENTUSER)
    }catch {
        print("error saving user locally", error.localizedDescription)
    }
    
}
