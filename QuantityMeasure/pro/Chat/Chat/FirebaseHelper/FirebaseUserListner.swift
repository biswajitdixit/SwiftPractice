import Firebase

class FirebaseUserListner {
    
    static let shared = FirebaseUserListner()
    
    private init () {}
    
    //Marks:- Login
  
    
    //Marks:- Register
    func registerUser(email:String, password:String, completion: @escaping (_ error: Error?) -> Void){
        Auth.auth().createUser(withEmail: email, password: password) { (authDataresult, error) in
            completion(error)
            
            if authDataresult?.user != nil {
                let user = User(id: authDataresult!.user.uid, userName: email, email: email, ImageLink: "", status: "Hey there I'm using Telegram")
                saveUserLocally(user)
                self.saveUserToFireStore(user)
            }
        }
    }



//Marks:- Save user
    func saveUserToFireStore(_ user:User){
        
        do {
            try FirebaseReference(.User).document(user.id).setData(from: user )
        }catch{
            print(error.localizedDescription, "adding user")
        }
    }
//Marks:- Download user

    
}
