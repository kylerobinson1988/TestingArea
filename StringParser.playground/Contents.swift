// STRING PARSER!

// I wrote a simple class and function that will take any string and rearrange it as an array of numbers, from smallest to largest. Numbers are separated by commas; without a comma, it's counted as one number.

import UIKit

class StringParser {
    
    //This is the string you enter when initializing the class.
    var stringInQuestion: String!
    
    //This is where the numbers between commas are added.
    var checkingString = ""
    
    //This array is where the unsorted numbers are sent.
    var testingArray: [Int] = []
    
    func makeNewArray() -> [Int] {
        
        //This array contains the sorted result numbers.
        var resultArray: [Int] = []
        
        //This variable is used to catch a situation where the input string has
        //no numbers.
        var noCharacters = true
        
        // First, I check to see if the string has commas or not. A string with commas
        // will count the characters inside as a longer number.
        // 789 is 7, 8, and 9, while ,789, is 789.
        
        for character in stringInQuestion {
            
            let charString = String(character)
            
            if let intChar = charString.toInt() {
                
                //Add this character to checkingString
                checkingString += "\(character)"
                
                noCharacters = false
                
            } else if character == "," {
                
                //Write checkingString into my array.
                if checkingString != "" {
                    
                    let numberToWrite = checkingString.toInt()
                    
                    testingArray.append(numberToWrite!)
                    
                }
                
                //Clear out checkingString after writing it to the array.
                checkingString = ""
                
            } else if character == "-" {
                
                let minusCheck = checkingString.toInt()
                
                if minusCheck < 0 {
                    
                    checkingString = "-" + checkingString
                    
                }
                
            }
            
        }
        
        if checkingString != "" {
            
            let numberToWrite = checkingString.toInt()
            
            testingArray.append(numberToWrite!)
            
        }
        
        if noCharacters == true {
            
            println("Sorry, your string has no numbers in it.")
            
        } else {
            
            var smallestNumber = 0
            
            for item in testingArray {
                
                if item <= smallestNumber {
                    
                    resultArray.insert(item, atIndex: 0)
                    
                } else {
                    
                    var insertAt = 0
                    
                    for position in resultArray {
                        
                        if item > position {
                            
                            insertAt += 1
                            
                        }
                        
                    }
                    
                    resultArray.insert(item, atIndex: insertAt)
                    
                }
                
                smallestNumber = item
            
            }
            
        }
        
        return resultArray
        
    }
    
    func reverseString() -> String {
        
        
        //This function returns the reverse of the string initialized.
        
        var finalString = ""
        
        for item in stringInQuestion {
            
            
            finalString = "\(item)" + finalString
            
        }
        
        return finalString
        
    }
    
    init(myString: String) {
        
        self.stringInQuestion = myString
        
    }
    
}

// These are some sample strings that I input to test the function.
let evilString = "Bil,3,lyB,7,onk,1,in,88,s,@,"
let boringString = "57839673"
let commaString = "4,745,6988,-5,-281,88,9001"
let hydrantString = "I was Hydrant."

// And the results!
StringParser(myString: evilString).makeNewArray()
StringParser(myString: boringString).makeNewArray()
StringParser(myString: commaString).makeNewArray()
StringParser(myString: hydrantString).makeNewArray()

StringParser(myString: hydrantString).reverseString()





