

import UIKit

class CityListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var watherData : WeatherData!
    var cityName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.title = self.cityName ?? ""
        self.navigationController?.navigationBar.navigationBarCustomStyle()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

}


extension CityListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.watherData.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ListCellView
        let weather = watherData.list[indexPath.row].weather
        let temp = watherData.list[indexPath.row].main
        if weather.count > 0 {
            let main = weather[0].main
            cell.mainLabel?.text = main.rawValue
            let tempValue : Double = (temp.temp - 273.15)
            let formatted = String(format: "Temp: %.2f", tempValue)
            cell.tempLabel.text = formatted

        }
        //295.43K − 273.15
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let listObj = watherData.list[indexPath.row]
        let storyBd = UIStoryboard.init(name: Constents.storyBoardName, bundle: nil)
        let vc = storyBd.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.cityName = cityName
        vc.listObject = listObj
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

class ListCellView : UITableViewCell {
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
}
