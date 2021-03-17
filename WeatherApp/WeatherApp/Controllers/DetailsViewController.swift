

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    var cityName: String?
    var listObject : List?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = cityName ?? ""
        self.dataDisplayOnLabels()
        // Do any additional setup after loading the view.
    }
    
    func dataDisplayOnLabels()  {
        if let weather = self.listObject?.weather {
            let main = weather[0].main
            let descrip = weather[0].weatherDescription.rawValue
            self.mainLabel.text = main.rawValue
            self.descriptionLabel.text = descrip
        }
        
        if let temp = self.listObject?.main {
        
            let tempValue : Double = (temp.temp - 273.15)
            let formatted = String(format: " %.2f", tempValue)
            self.tempLabel.text = formatted
        }
        
        if let feelslike = self.listObject?.main.feelsLike {
            let tempValue : Double = (feelslike - 273.15)
            let formatted = String(format: " %.2f", tempValue)
            self.feelsLikeLabel.text = "Feels like: \(formatted)"

        }
        
    }

}
