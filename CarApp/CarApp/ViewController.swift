import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var car = Car()
    var features = [
        Feature(name: "Color", options: ["Red", "Blue", "Black", "White"]),
        Feature(name: "Tires", options: ["Standard", "Sport", "All-terrain"]),
        Feature(name: "Engine", options: ["Electric", "V6", "V8"]),
        Feature(name: "Interior", options: ["Leather", "Fabric"]),
        Feature(name: "navigation", options: ["manual", "Artificial Intelligence"])    ]
    
    var selectedFeature: Feature?
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var featureSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        setupSegmentedControl()
        selectFeature(features.first!) // Default to first feature as the initial selection
    }
    
    func setupSegmentedControl() {
        featureSegmentedControl.removeAllSegments()
        for (index, feature) in features.enumerated() {
            featureSegmentedControl.insertSegment(withTitle: feature.name, at: index, animated: false)
        }
        featureSegmentedControl.selectedSegmentIndex = 0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selectedFeature?.options.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return selectedFeature?.options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let feature = selectedFeature, row < feature.options.count else { return }
        let selectedOption = feature.options[row]
        updateCarWithSelectedOption(feature: feature.name, option: selectedOption)
        showConfirmationAlert(message: "\(feature.name): \(selectedOption) selected")
    }
    
    func updateCarWithSelectedOption(feature: String, option: String) {
        switch feature {
        case "Color":
            car.color = option
        case "Tires":
            car.tires = option
        case "Engine":
            car.engine = option
        case "Interior":
            car.interior = option
        case "navigation":
            car.navigation = option
        default:
            break
        }
    }
    
    func showConfirmationAlert(message: String) {
        let alert = UIAlertController(title: "Selection Confirmed", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    @IBAction func featureSelectionChanged(_ sender: UISegmentedControl) {
        let selectedFeature = features[sender.selectedSegmentIndex]
        selectFeature(selectedFeature)
    }
    
    func selectFeature(_ feature: Feature) {
        selectedFeature = feature
        pickerView.reloadAllComponents()
    }
}
