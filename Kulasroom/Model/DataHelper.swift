//
//  DataHelper.swift
//  Kulasroom
//
//  Created by Batuhan Arat on 6.01.2023.
//
//
import Foundation

class DataHelper {
    
    
    var CASE:Building
    var SOS: Building
    var ENG: Building
    var ELC: Building
    var SNA: Building
    var SCI: Building
    
    
    var currentBuilding :Building = {.init(buildingName: "test")}()
    var currentClassroom :Classroom = {.init(id: -1, name: "test")}()
    var filterResultClassrooms: [Classroom] = []
    var delegate: ClassroomDataDelegate?
    var id_ :Int = 0
    public var anothercounter : Int = 0
    
    
    
    init() {
        
        self.CASE = {.init( buildingName: "CASE")}()
        self.SOS = {.init( buildingName: "SOS")}()
        self.ENG = {.init( buildingName: "ENG")}()
        self.SNA  = {.init( buildingName: "SNA")}()
        self.ELC  = {.init( buildingName: "ELC")}()
        self.SCI  = {.init( buildingName: "SCI")}()
        
        
        
    }
    
    
    func returnFilteredClassrooms() -> [Classroom] {
        return filterResultClassrooms
    }
    
    
    func initializedata(array: [Data]) {
                
        for data in array {
            
            
            if (data.Class.contains("CASE") ) {
                
                if(CASE.buildingClassroomArray.isEmpty) {
                    
                    var classroom: Classroom  = {.init(id: id_ ,name: data.Class)} ()
                    var lecture: Lecture = {.init(time: data.Time) }()
                    classroom.scheduleArray.append(lecture)
                    CASE.buildingClassroomArray.append(classroom)
                    increaseId()
                    
                }
                else if(CASE.getClassroomNameArray().contains(data.Class)) {
                    
                    var lecture: Lecture = {.init(time: data.Time) }()
                    CASE.getClassroom(Name: data.Class).scheduleArray.append(lecture)
                   
                } else {
                    var classroom: Classroom  = {.init(id: id_ ,name: data.Class)} ()
                    var lecture: Lecture = {.init(time: data.Time) }()
                    classroom.scheduleArray.append(lecture)
                    CASE.buildingClassroomArray.append(classroom)
                    increaseId()
                    
                }
                
            }
            
            
            if (data.Class.contains("SOS") ) {
                
                
                if(SOS.buildingClassroomArray.isEmpty) {
                    var classroom: Classroom = {.init(id: id_ ,name: data.Class)} ()
                    var lecture: Lecture = {.init(time: data.Time) }()
                    classroom.scheduleArray.append(lecture)
                    SOS.buildingClassroomArray.append(classroom)
                    increaseId()                 }
                
                
                else if(SOS.getClassroomNameArray().contains(data.Class)) {
                    var lecture: Lecture = {.init(time: data.Time) }()
                    var classroom : Classroom =  SOS.getClassroom(Name: data.Class)
                    classroom.scheduleArray.append(lecture)
                    
                } else {
                    
                    var classroom: Classroom = {.init(id: id_ ,name: data.Class)} ()
                    var lecture: Lecture = {.init(time: data.Time) }()
                    classroom.scheduleArray.append(lecture)
                    SOS.buildingClassroomArray.append(classroom)
                    increaseId()
                }
            }
            
            if (data.Class.contains("SCI") ) {
                
                if(SCI.buildingClassroomArray.isEmpty) {
                    var classroom: Classroom = {.init(id: id_ ,name: data.Class)} ()
                    var lecture: Lecture = {.init(time: data.Time) }()
                    classroom.scheduleArray.append(lecture)
                    SCI.buildingClassroomArray.append(classroom)
                    increaseId()
                    
                }
                
                else if(SCI.getClassroomNameArray().contains(data.Class)) {
                    
                    var lecture: Lecture = {.init(time: data.Time) }()
                    var classr : Classroom =  SCI.getClassroom(Name: data.Class)
                    classr.scheduleArray.append(lecture)
                    
                } else {
                    
                    var classroom: Classroom = {.init(id: id_ ,name: data.Class)} ()
                    var lecture: Lecture = {.init(time: data.Time) }()
                    classroom.scheduleArray.append(lecture)
                    SCI.buildingClassroomArray.append(classroom)
                    increaseId()
                }
                
            }
            
            
            if (data.Class.contains("ENG") ) {
                
                
                if(ENG.buildingClassroomArray.isEmpty) {
                    
                    var classroom: Classroom = {.init(id: id_ ,name: data.Class)} ()
                    var lecture: Lecture = {.init(time: data.Time) }()
                    classroom.scheduleArray.append(lecture)
                    ENG.buildingClassroomArray.append(classroom)
                    increaseId()
                    
                }
                
                else  if(ENG.getClassroomNameArray().contains(data.Class)) {
                    
                    var lecture: Lecture = {.init(time: data.Time) }()
                    var classr : Classroom =  ENG.getClassroom(Name: data.Class)
                    classr.scheduleArray.append(lecture)
                    
                } else {
                    
                    var classroom: Classroom = {.init(id: id_ ,name: data.Class)} ()
                    var lecture: Lecture = {.init(time: data.Time) }()
                    classroom.scheduleArray.append(lecture)
                    ENG.buildingClassroomArray.append(classroom)
                    increaseId()
                }
                
                
            }
            
            if (data.Class.contains("SNA") ) {
                
                
                if(SNA.buildingClassroomArray.isEmpty) {
                    var classroom: Classroom = {.init(id: id_ ,name: data.Class)} ()
                    var lecture: Lecture = {.init(time: data.Time) }()
                    classroom.scheduleArray.append(lecture)
                    SNA.buildingClassroomArray.append(classroom)
                    increaseId()                 }
                
                else if(SNA.getClassroomNameArray().contains(data.Class)) {
                    
                    var lecture: Lecture = {.init(time: data.Time) }()
                    var classr : Classroom =  SNA.getClassroom(Name: data.Class)
                    classr.scheduleArray.append(lecture)
                    
                } else {
                    
                    var classroom: Classroom = {.init(id: id_ ,name: data.Class)} ()
                    var lecture: Lecture = {.init(time: data.Time) }()
                    classroom.scheduleArray.append(lecture)
                    SNA.buildingClassroomArray.append(classroom)
                    increaseId()
                }
                
                
            }
            
            
            if (data.Class.contains("ELC") ) {
                
                if(ELC.buildingClassroomArray.isEmpty) {
                    var classroom: Classroom = {.init(id: id_ ,name: data.Class)} ()
                    var lecture: Lecture = {.init(time: data.Time) }()
                    classroom.scheduleArray.append(lecture)
                    ELC.buildingClassroomArray.append(classroom)
                    increaseId()                 }
                
                else if(ELC.getClassroomNameArray().contains(data.Class)) {
                    
                    var lecture: Lecture = {.init(time: data.Time) }()
                    var classr : Classroom =  ELC.getClassroom(Name: data.Class)
                    classr.scheduleArray.append(lecture)
                    
                } else {
                    
                    var classroom: Classroom = {.init(id: id_ ,name: data.Class)} ()
                    var lecture: Lecture = {.init(time: data.Time) }()
                    classroom.scheduleArray.append(lecture)
                    ELC.buildingClassroomArray.append(classroom)
                    increaseId()
                }
                
                
            }
            
            
            
        }
        
        
    }
    
    
    
    func increaseId() {
        id_ = (id_ + 1)
        
    }
    
    func printBuilding() {
        
        
        printBuildingArray(buildingarray: self.CASE.buildingClassroomArray)
//        printBuildingArray(buildingarray: self.SOS.buildingClassroomArray)
//        printBuildingArray(buildingarray: self.ELC.buildingClassroomArray)
//        printBuildingArray(buildingarray: self.SCI.buildingClassroomArray)
//        printBuildingArray(buildingarray: self.ENG.buildingClassroomArray)
//        printBuildingArray(buildingarray: self.SNA.buildingClassroomArray)
        
        
    }
    
    func printBuildingArray(buildingarray: [Classroom]) {
        
        for classroom in buildingarray {
            
            print("--------------")
            print("Classroom Name: \(classroom.name), Classroom id: \(classroom.id)")
            printScheduleArray(schedulearray: classroom.scheduleArray)
            
        }
        
    }
    
    func printScheduleArray(schedulearray: [Lecture]) {
        
        var printString: String = ""
        
        
        for lecture in schedulearray {
            printString = printString + lecture.time + ", "
            
        }
        
        print("Schedule Array:   \(printString)")
        
        
    }
    
    
    
    func filter(filterbuilding:String , filtertime:String) {
        if(!currentBuilding.buildingName.isEmpty) {
            self.currentBuilding =  filterAlgorithmbyBuilding(building: filterbuilding)

        }
        
        if(!filtertime.isEmpty) {
            let timeInterval:String = createTimeIntervalForAlgorithm(time: filtertime)
            filterAlgorithmByTimeInterval(timeInterval: timeInterval, buildingArray: self.currentBuilding.buildingClassroomArray)
        }
        
        for classroomsresult in filterResultClassrooms {
            
            print(classroomsresult.name)
        }
        
        
    }
    
 
    
    func filterAlgorithmbyBuilding(building:String) -> Building {
        
        if(building == "SOS") {
            return SOS
        }
        if(building == "CASE") {
            return CASE
        }
        if(building == "SNA") {
            return SNA
        }
        if(building == "ENG") {
            return ENG
        }
        if(building == "ELC") {
            return ELC
        }
        if(building == "SCI") {
            return SCI
        }
        return currentBuilding
    }
    
    
    func createTimeIntervalForAlgorithm(time:String)  -> String{
        
        if(time == "8:30-10:00") {
            return "08:30 - 09:40"
        }
        else if(time == "10:00-11:30")  {
            return "10:00 - 11:20"
        }
        else if(time == "11:30-13:00" ) {
            return "11:30 - 12:40"
        }
        else if(time == "13:00-14:30" ) {
            return "13:00 - 14:10"
        }
        else if(time == "14:30-16:00" ) {
            return "14:30 - 15:40"
        }
        else if(time == "16:00-17:30") {
            return "16:00 - 17:15"
        }
        else if(time == "17:30-19:00") {
            return "17:30 - 18:40"
        }
        else if(time == "19:00-20:30") {
            return "19:00 - 20:15"
        }
        return "error"
    }
    
    
    func isBWithinA(A: String, B: String) -> Bool {

        let AArray = A.components(separatedBy: "-")
           let BArray = B.components(separatedBy: "-")
           let AStart = AArray[0].trimmingCharacters(in: .whitespaces)
           let AEnd = AArray[1].trimmingCharacters(in: .whitespaces)
           let BStart = BArray[0].trimmingCharacters(in: .whitespaces)
           let BEnd = BArray[1].trimmingCharacters(in: .whitespaces)
           
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "HH:mm"
           let aStart = dateFormatter.date(from: AStart)
           let aEnd = dateFormatter.date(from: AEnd)
           let bStart = dateFormatter.date(from: BStart)
           let bEnd = dateFormatter.date(from: BEnd)
           
           return (bStart! <= aEnd! && bStart! >= aStart!) || (bEnd! <= aEnd! && bEnd! >= aStart!)
        
    }
    
    func filterAlgorithmByTimeInterval(timeInterval: String, buildingArray: [Classroom]) {
        
        
        for classroom in buildingArray {
            
            var count:Int = 0
            
            for lecture in classroom.scheduleArray {
                
                
                if(lecture.time == timeInterval) {
                    count+=1
                    
                }
                
              else  if(isBWithinA(A: lecture.time, B: timeInterval))
               {
                  
                    count+=1
                   
               }
                
                
            }
            
            print(" classrooms")
            print(classroom.name)
            print(count)
            print(" classrooms")
            
            if(count==0) {
                print("added classrooms")
                print(classroom.name)
                print(count)
                print("added classrooms")
                filterResultClassrooms.append(classroom)
            }
            
            
            
           
        }
        
    }
    
    
    
    
    
    
    
    
}
