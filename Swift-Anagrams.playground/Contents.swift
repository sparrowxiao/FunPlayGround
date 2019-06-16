import Foundation

// Complete the makeAnagram function below.
func makeAnagram(a: String, b: String) -> Int {
    
    var diff_num : Int = 0
    
    //The strings a and b consist of lowercase English alphabetic letters ascii[a-z].
    //use this two array , we can mapping the num of each alphobetic letters
    // 'a' --> 0 'b' --> 1 ... 'z' --> 25
    //
    var arr_ch_A : [Int] = Array (repeating:0, count:26)
    var arr_ch_B : [Int] = Array (repeating:0, count:26)
    

    //To-do: maybe i can try char in the string in swift but now i use UTF8 seems too much work
    for unicode in a.utf8{
        let temp : Int = Int(unicode)
        arr_ch_A[temp - 97] += 1
        //print("\(arr_ch_A)")
        
    }
    
    for unicode in b.utf8{
        let temp : Int = Int(unicode)
        arr_ch_B[temp - 97] += 1
        //print("\(arr_ch_B)")
    }
    
    for i in 0..<arr_ch_A.count{
        //print("\(i)")
        if arr_ch_A[i] > arr_ch_B[i]{
            diff_num += (arr_ch_A[i] - arr_ch_B[i])
        }else if arr_ch_B[i] > arr_ch_A[i]{
            diff_num += (arr_ch_B[i] - arr_ch_A[i])
        }
            
        
    }
    
    return diff_num
    
}


//test pass
var str_a : String = "cde"
var str_b : String = "abc"


var result : Int = 0

result = makeAnagram(a: str_a, b: str_b)
