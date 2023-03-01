//
//  SearchResultScreenController.swift
//  Kulasroom
//
//  Created by Batuhan Arat on 6.01.2023.
//

import Foundation
import UIKit


class SearchResultViewController: UIViewController {
    
    let day = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    let faculties = ["CASE", "SOS", "SNA", "ENG", "ELC", "SCI"]
    
    @IBOutlet weak var resultTableView: UITableView!
    
   public var kusisDataSource = KusisDataSource()
     var classroomList: [Classroom] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        kusisDataSource.delegate = self
//        classroomList = kusisDataSource.buildingClassroomArray
        
//        print("ŞU AN search un result viewundayım")
//            print(classroomList)
//
//        for classroomsresult in classroomList {
//
//            print(classroomsresult.name)
//        }
//        print("ŞU AN ")


        
    }
    
    
//     MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

         if let cell = sender as? SearchResultTableViewCell,
           let indexPath = resultTableView.indexPath(for: cell),
            let classroom = kusisDataSource.getClassroom(for: indexPath.row),

           let scheduleViewController = segue.destination as? ClassroomScheduleViewController {
             scheduleViewController.classroomLectureScheduleArray = classroom.scheduleArray
        }
    }

    

    
    
    
    
    
    
    
    
    
    
}


extension SearchResultViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return classroomList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClassroomCell")
                as? SearchResultTableViewCell
        else {
            return UITableViewCell()
        }
        
        if let classroom = kusisDataSource.getClassroom(for: indexPath.row) {
            
            cell.classroomNameLabel.text = classroom.name
        } else {
            cell.classroomNameLabel.text = ""

        }
            
        return cell
        
        
        
    }
    
    
    
}

extension SearchResultViewController: ClassroomDataDelegate {
   
    
    func classroomListLoaded() {
        //classroomList
        self.resultTableView.reloadData()

        
    }
    
    
    
    
}
