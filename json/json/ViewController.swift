
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    var arrdata = [JsonStruct]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
    }
    func getdata(){
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{
                if error == nil{
                   self.arrdata =  try JSONDecoder().decode([JsonStruct].self, from: data!)
                    for mainArray in self.arrdata{
                        print(mainArray.name,":",mainArray.capital,":",mainArray.alpha3Code)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    }
                }
            }catch{
                print("error in json data ")
            }
           
        }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.lblname.text = "Name : \(arrdata[indexPath.row].name)"
        cell.lblcapital.text = "Capital : \(arrdata[indexPath.row].capital)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        detail.strAlpha2 = "Alpha2Code : \(arrdata[indexPath.row].alpha2Code)"
        detail.strAlpha3 = "Alpha3Code : \(arrdata[indexPath.row].alpha3Code)"
        detail.strRegion = "Region : \( arrdata[indexPath.row].region)"
        detail.strSubRegion = "SubRegion : \( arrdata[indexPath.row].subregion)"
        self.navigationController?.pushViewController(detail, animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        let trasform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = trasform
        UIView.animate(withDuration: 2.0){
            cell.alpha =  1
            cell.layer.transform = CATransform3DIdentity
        }
        
    }
}

