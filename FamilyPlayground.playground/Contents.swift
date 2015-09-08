//: Playground - noun: a place where people can play

import UIKit

enum FamilyMember: String {
    
    case Father = "Father"
    case Mother = "Mother"
    case Son = "Son"
    case Daughter = "Daughter"
    case Grandmother = "Grandmother"
    case Grandfather = "Grandfather"
    case Uncle = "Uncle"
    case Aunt = "Aunt"
    
}

class FamilyHuman {
    
    var name: String
    var age: Int
    var job: String
    var type: FamilyMember
    
    func introduceSelf() -> String {
        
        let introString = "Hello, my name is \(name), I'm \(age) years old, and my job is \(job)."
        
        return introString
        
    }
    
    func elaborateOnRole() -> String {
        
        var elaboration = ""
        
        switch type {
            
        case .Father:
            
            elaboration = "I'm the father of this family."
            
        case .Mother:
            
            elaboration = "You could call me the Mother and Housemistresses of this abode."
            
        case .Son:
            
            elaboration = "I am the very proud son of Billy Bonkins."
            
        case .Daughter:
            
            elaboration = "I'm the Daughter and burgeoning Housemistresses, myself."
            
        case .Grandfather:
            
            elaboration = "Wie est der Grandfauzer."
            
        case .Grandmother:
            
            elaboration = "Call'me Granny."
            
        case .Uncle:
            
            elaboration = "I knew Billy before he was Hydrant. Also, I am Uncle."
            
        case .Aunt:
            
            elaboration = "This family has no Aunt, so I shouldn't even exist. What the heck."
            
        default:
            
            elaboration = "This shouldn't be happening; you just broke the enum!"
            
        }
        
        return elaboration
        
    }
    
    init(name: String, age: Int, job: String, type: FamilyMember) {
        
        self.name = name
        self.age = age
        self.job = job
        self.type = type
        
    }
    
}

let Billy = FamilyHuman(name: "Billy Bonkins", age: 40, job: "Dogcatcher", type: .Father)
let Tina = FamilyHuman(name: "Tina Tonkins", age: 37, job: "Housemistress", type: .Mother)
let Williard = FamilyHuman(name: "Williar Wonkin Bonkins", age: 10, job: "Feral Child", type: .Son)
let Bartimaeus = FamilyHuman(name: "Bartimaeus Beauregard Bonkins", age: 56, job: "Crazy Uncle", type: .Uncle)

Billy.introduceSelf()
Tina.elaborateOnRole()









