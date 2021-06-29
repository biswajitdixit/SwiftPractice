
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tblView: UITableView!
    var  viewModelUser = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelUser.vc = self
        tblView.register(UINib(nibName: "UserCell", bundle: nil),forCellReuseIdentifier: "UserCell")
        viewModelUser.getAllUserDataAF()
        
    }


}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelUser.arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell",for: indexPath) as? UserCell
        let modelUser = viewModelUser.arrUsers[indexPath.row]
        let status = modelUser.getStatusColor()
        cell?.lblStatus.text = status.0
        cell?.backgroundColor = status.1
        cell?.lblID.text = "\(modelUser.id!)"
        cell?.lblTitle.text = modelUser.title
        return cell!
    }
    
}

