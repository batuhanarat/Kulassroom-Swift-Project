//
//  Building.swift
//  Kulasroom
//
//  Created by Batuhan Arat on 5.01.2023.
//

import Foundation

class Building  {
    
     var buildingClassroomArray: [Classroom] = []
     var buildingName: String
    
    

    
    init(buildingName:String) {
        self.buildingName = buildingName

    }
    
    
     func getClassroomNameArray() -> [String] {
        
        
        var  classroomArrayWithJustNames: [String] = []

        for element in buildingClassroomArray {
            
            
             classroomArrayWithJustNames.append(element.name)
            
            
            
        }
        
        return classroomArrayWithJustNames

        

        
        
        
    }
    
     func getClassroom(Name: String) -> Classroom {
        
        var returnedClassroom: Classroom = {.init(id: 0, name: "test")}()
        
        for element in buildingClassroomArray {
            
            if(element.name == Name) {
                
                returnedClassroom = element
            }
            
            
        }
        
        return returnedClassroom

        
    }
    
    
    
    
    
    
    
    
}
