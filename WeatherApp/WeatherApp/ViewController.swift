

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lookupButton: UIButton!
    @IBOutlet weak var cityNameLabel: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.isHidden = true
        cityNameLabel.setBottomBorder()
        lookupButton.layer.borderWidth = 0.5
        lookupButton.layer.borderColor = UIColor.gray.cgColor
        lookupButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    @IBAction func lookupButtonActions(_ sender: UIButton) {

        guard let cityName = self.cityNameLabel.text, cityName.count > 0 else {
            Toast.show(message: Constents.cityNameValidate, controller: self)
            return
        }
        let weatherViewModel = WeatherViewModel()
        weatherViewModel.cityName  = cityName
        weatherViewModel.apiCalling()
        print("service Loading");
        self.activityIndicator.isHidden = false

        activityIndicator.startAnimating()
        weatherViewModel.bindWeatherViewModelToController = {
           // self.updateDataSource()
            print("data retreving....");

            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                let storyBd = UIStoryboard.init(name: Constents.storyBoardName, bundle: nil)
                let vc = storyBd.instantiateViewController(withIdentifier: "CityListViewController") as! CityListViewController
                vc.watherData = weatherViewModel.watherData
                vc.cityName = cityName
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.cityNameLabel.resignFirstResponder()
        
    }
}

