//
//  ViewController.swift
//  Kulasroom
//
//  Created by Batuhan Arat on 5.01.2023.
//

import UIKit
import Firebase
import FirebaseAuth

class MainScreenViewController: UIViewController {

    @IBOutlet weak var buttonForNavigation: UIButton!
    
    @IBOutlet weak var InfoButton: UIButton!
    @IBOutlet weak var Daypicker: UIPickerView!
    @IBOutlet weak var BuildingPicker: UIPickerView!
    @IBOutlet weak var TimePicker: UIPickerView!
    
    @IBOutlet weak var daylabel: UILabel!
    
    @IBOutlet weak var Buildlabel: UILabel!
    
    @IBOutlet weak var timelabel: UILabel!
    
    
    private let kusisDataSource = KusisDataSource()
    
    let day = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    let times = ["8:30-10:00", "10:00-11:30", "11:30-13:00", "13:00-14:30", "14:30-16:00","16:00-17:30","17:30-19:00","19:00-20:30"]
    let faculties = ["CASE", "SOS", "SNA", "ENG", "ELC", "SCI"]
    
    var selectedDay : String = ""
    var selectedTime : String = ""
    var selectedFaculty : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        kusisDataSource.delegate = self

        print("maindeyim")
      print(  kusisDataSource.buildingClassroomArray)
        print("+++++++%%")

        
    }
    
    @IBAction func logoutclickked(_ sender: Any) {
        logoutUser()
    }
    
    func logoutUser() {
        do { try Auth.auth().signOut() }
        catch { print("already logged out") }
        
        navigationController?.popToRootViewController(animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

        
        if let destination = segue.destination as? SearchResultViewController {
            destination.classroomList = kusisDataSource.buildingClassroomArray
            destination.kusisDataSource = self.kusisDataSource
        }
        
        
    }
    
    
    

}

extension MainScreenViewController:ClassroomDataDelegate {
    func getAvailableClassroomsInGivenFilter() {
        
    }
    
    
    
    
    func classroomListLoaded() {
        
    }
    
    
    
    
    
}

extension MainScreenViewController:UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case Daypicker:
            return day.count
        case BuildingPicker:
            return faculties.count
        case TimePicker:
            return times.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case Daypicker:
            return day[row]
        case BuildingPicker:
            return faculties[row]
        case TimePicker:
            return times[row]
        default:
            return ("error")
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case Daypicker:
            daylabel.text = day[row]
            selectedDay = day[row]
        case BuildingPicker:
            Buildlabel.text = faculties[row]
            selectedFaculty = faculties[row]
        case TimePicker:
            timelabel.text = times[row]
            selectedTime = times[row]
        default:
            print("error")
        }
        kusisDataSource.initalizeDay(day: selectedDay)
        kusisDataSource.setFilter(inputBuilding: selectedFaculty, inputTime: selectedTime)
        kusisDataSource.getData()
        
    }
}
