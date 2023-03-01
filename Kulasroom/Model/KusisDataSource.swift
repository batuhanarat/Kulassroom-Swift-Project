//
//  KusisDataSource.swift
//  Kulasroom
//
//  Created by Batuhan Arat on 5.01.2023.
//

import Foundation

class KusisDataSource {
    
    var delegate: ClassroomDataDelegate?
    
    let data1: Data = {.init(Day: "aaa", Time: "bbbb", Class: "String")}()
    let data2: Data = {.init(Day: "ccc", Time: "xxxx", Class: "String2")}()


    public var fakedataArray : [Data] = []
    public var dataArray : [Data] = []

    
    public var lectureArray: [Lecture] = []
    public var buildingClassroomArray: [Classroom] = []
    public var classroomLectureScheduleArray: [Lecture] = []
    
    
    public var day: String = ""
    public var inputBuilding: String = ""
    public var inputTime: String = ""

    public var baseURL : String = ""
    
    var filteredResultClassrooms: [Classroom] = []
    
    
    
    func initalizeDay(day: String) {
        
        if(day == "Monday") {
            
            self.day = "monday"
            self.baseURL = "https://gist.githubusercontent.com/ecemkuloglu/2584130fb471bba39f42ed5bf43b337b/raw/b6f492265cb704078bc900fdee3652e8c3644a29/monday.json"
        }
       else if(day == "Tuesday") {
            
            self.day = "tuesday"
            
           self.baseURL = "https://gist.githubusercontent.com/ecemkuloglu/d0196e3989468cdf9b74616c05b80d8b/raw/2beec3dae1c3e37ac5d591961cdb3a6c96f1c870/tuesday.json"
            
        }
        else if(day == "Wednesday") {
            
            self.day = "wednesday"
            
            self.baseURL = "https://gist.githubusercontent.com/ecemkuloglu/6e2b51c694ffcf85dfac5eab8d01b790/raw/6dac6d43f4558a3ad5ad24354d569df6a45dce68/wednesday.json"
            
        }
        else if(day == "Thursday") {
            
            self.day = "thursday"
            
            self.baseURL = "https://gist.githubusercontent.com/ecemkuloglu/09d0933d7887f5d101dd620d833c9a07/raw/4dab84a0e4b8bd2ad7cd22bcd978b87f2b228fb9/thursday.json"
            
        }
        
        else if(day == "Friday"){
            
            self.day = "friday"
            
            self.baseURL = "https://gist.githubusercontent.com/ecemkuloglu/ce4c64fbf910b7b94121564530ba4922/raw/db467bf9eba143957c1d54ca00cd07a0a109490b/friday.json"
            
        }

    }
    
    
    func setFilter(inputBuilding: String, inputTime: String) {
        self.inputBuilding = inputBuilding
        self.inputTime = inputTime
        
    }

    
    
    
    func getDataamabaska(for index: Int) -> Data? {
        
        
        guard index < dataArray.count else {
            return nil
        }
        
        return dataArray[index]
    }
    
 
    
    func getData()  {
        
            let session = URLSession.shared
            
        if let url = URL(string: "\(self.baseURL)/") {
                
                
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                request.addValue( "application/json",
                                  forHTTPHeaderField: "Content-Type")
                
                let dataTask = session.dataTask(with: request) {
                    data, response, error in
                    
                    if let data = data {

                            let decoder = JSONDecoder()
                            
                            self.fakedataArray = try! decoder.decode([Data].self, from: data)

                                

                        
                             DispatchQueue.main.async {
                                
                                 
                                 
                                 self.delegate?.classroomListLoaded()

                        }


                    }
                    
                    self.setData(dataArray: self.fakedataArray)

                    
                    
                    
                }


                
                dataTask.resume()
                
            }
        
        
        
        }
    
 
    
    func setData(dataArray: [Data]) {
        
        self.dataArray = dataArray
        var datahelper: DataHelper = DataHelper()
        datahelper.initializedata(array: self.dataArray)
        
        
        datahelper.filter(filterbuilding: self.inputBuilding,filtertime: self.inputTime)
        
        self.buildingClassroomArray = datahelper.returnFilteredClassrooms()
        
        
//        print("HUHUHU")
//
//        print(buildingClassroomArray)
//
//
//        for classroomsresult in buildingClassroomArray {
//
//            print(classroomsresult.name)
//        }
//        datahelper.printBuilding()
        
    }
    
    
    
    
    
    func getClassroom(for index: Int) -> Classroom? {
        
        guard index <  buildingClassroomArray.count  else {
            return nil
            
        }
        return buildingClassroomArray[index]
        
    }

    func getLecture(for index: Int) -> Lecture? {
        
        guard index < classroomLectureScheduleArray.count  else {
            return nil
            
        }
        return classroomLectureScheduleArray[index]
        
    }

    
    
    

    func getListOfClassrooms() -> [Classroom] {
        
        return self.buildingClassroomArray
        
    }
    
    
    
    
    
    
    //bunlar değişecek
    //seçilen uygun olan sınıfın scheduleını atıcak
    func getListOfClassroomSchedule(classroom: Classroom) -> [Lecture] {
        
        let classroomSchedule: [Lecture]  = classroom.scheduleArray

    
        return classroomSchedule
        
    }
    
    
    func getNumberOfClassRoomAvailable() -> Int {
        return buildingClassroomArray.count
    }
       
    
    
    
    
}

