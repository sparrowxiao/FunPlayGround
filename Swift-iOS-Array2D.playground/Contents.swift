import Foundation

func hourglassSum(arr: [[Int]]) -> Int {
    var sum: Int = Int.min
    
    for i in 1...4{
        for j in 1...4{
            //print("[\(i) \(j)]")
            let centerNum:Int = arr[i][j]
            let sumOfHourGlassSum:Int = arr[i-1][j-1]+arr[i-1][j]+arr[i-1][j+1]+centerNum+arr[i+1][j-1]+arr[i+1][j]+arr[i+1][j+1]
            //print("\(sumOfHourGlassSum)")
            if sumOfHourGlassSum > sum{
                sum = sumOfHourGlassSum
            }
            
        }
        
    }
    
    
    return sum
}

//let arr: [[Int]] = [[1,1,1,0,0,0],[0,1,0,0,0,0],[1,1,1,0,0,0],[0,0,2,4,4,0],[0,0,0,2,0,0],[0,0,1,2,4,0]]

let arr: [[Int]] = [[0,-4,-6,0,-7,-6],[-1,-2,-6,-8,-3,-1],[-8,-4,-2,-8,-8,-6],[-3,-1,-2,-5,-7,-4],[-3,-5,-3,-6,-6,-6],[-3,-6,0,-8,-6,-7]]




let result = hourglassSum(arr: arr)


//failed test
/*
0 -4 -6 0 -7 -6
-1 -2 -6 -8 -3 -1
-8 -4 -2 -8 -8 -6
-3 -1 -2 -5 -7 -4
-3 -5 -3 -6 -6 -6
-3 -6 0 -8 -6 -7
 
let arr: [[Int]] = [[0,-4,-6,0,-7,-6],[-1,-2,-6,-8,-3,-1],[-8,-4,-2,-8,-8,-6],[-3,-1,-2,-5,-7,-4],[-3,-5,-3,-6,-6,-6],[-3,-6,0,-8,-6,-7]]
*/

/*
 -1 -1 0 -9 -2 -2
 -2 -1 -6 -8 -2 -5
 -1 -1 -1 -2 -3 -4
 -1 -9 -2 -4 -4 -5
 -7 -3 -3 -2 -9 -9
 -1 -3 -1 -2 -4 -5
 */
