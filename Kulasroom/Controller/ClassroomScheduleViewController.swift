//
//  ClassroomScheduleViewController.swift
//  Kulasroom
//
//  Created by Batuhan Arat on 6.01.2023.
//

import Foundation
import UIKit


class ClassroomScheduleViewController: UIViewController {
    
    @IBOutlet weak var scheduleTableView: UITableView!
    
     private let  kusisDataSource = KusisDataSource()
     var classroomLectureScheduleArray: [Lecture] = []

    var classroom: Classroom? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kusisDataSource.delegate = self
        
       
        
    
    }
    
}

extension ClassroomScheduleViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classroomLectureScheduleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LectureCell")
                as? ClassroomScheduleTableViewCell
        else {
            return UITableViewCell()
        }
        
        print(indexPath.row)
        print(classroomLectureScheduleArray[indexPath.row].time)
        cell.classTimeLabel.text = classroomLectureScheduleArray[indexPath.row].time
        
        
       
       
        
//        if let lecture = kusisDataSource.getLecture(for: indexPath.row) {
//            cell.classTimeLabel.text = lecture.Time
//        } else {
//            cell.classTimeLabel.text = ""
//
//        }

        return cell
        
    }
    
    
    
    
    
}
extension ClassroomScheduleViewController: ClassroomDataDelegate {
    
    
    func scheduleListLoaded() {
        

       self.scheduleTableView.reloadData()

    
        
    }
    
   
    
    
    
    
}
