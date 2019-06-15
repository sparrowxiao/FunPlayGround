import Foundation


extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}

func binarySearchIndexForValueLessEqual(array:[Int], length: Int, height: Int , searchVal: Int) -> Int{
    if length < height {
        let mid : Int = (length + height)/2
        if searchVal < array[mid]{
            return binarySearchIndexForValueLessEqual(array: array, length: length, height: mid-1, searchVal: searchVal)
        }
        
        let result = binarySearchIndexForValueLessEqual(array: array, length: mid+1, height: height, searchVal: searchVal)
        if result == -1 {
            return mid
        }else{
            return result
        }
    }else{
        if array[length] <= searchVal{
            return length
        }else {
            return -1
        }
    }
}

// Complete the triplets function below.
func triplets(a: [Int], b: [Int], c: [Int]) -> Int {
    var num : Int = 0
    var new_a : [Int] = a
    var new_b : [Int] = b
    var new_c : [Int] = c
    
    //filer the repeat number in arrays
    //set --> array generate the distict array
    //so sorted() it
    new_a = Array(Set(new_a)).sorted()
    new_b = Array(Set(new_b)).sorted()
    new_c = Array(Set(new_c)).sorted()
    
    //for index node count// used for debug
    //var IndexA:[Int : Int] = [:]
    //var IndexC:[Int : Int] = [:]
    
    
    for i in 0..<new_b.count{
        let left : Int = binarySearchIndexForValueLessEqual(array: new_a, length: 0, height:new_a.count-1 , searchVal: new_b[i]) + 1
        //IndexA[new_b[i]] = left
        
        let right : Int = binarySearchIndexForValueLessEqual(array: new_c, length: 0, height: new_c.count-1, searchVal: new_b[i]) + 1
        
        //IndexC[new_b[i]] = right
        num += left * right
    }
    
    return num
    
}

//test case
let test_a : [Int]  = [1, 3, 5, 7]
let test_b : [Int]  = [5, 7, 9]
let test_c : [Int]  = [7, 9, 11, 13]

let triple_number =  triplets(a: test_a, b: test_b, c: test_c)
