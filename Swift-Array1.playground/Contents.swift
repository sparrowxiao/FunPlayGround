//: Playground - noun: a place where people can play


/*The len variable is equal to 5, meaning that array1 has 5 elements, whereas array2 has 6 elements:
 
 array1 = [1, 2, 3, 4, 5]
 array2 = [1, 2, 3, 4, 5, 6]
 When array1 is assigned to array2, a copy of array1 is actually created and assigned.
 
 The reason is that swift arrays are value types (implemented as structs) and not reference types (i.e. classes). When a value type is assigned to a variable, passed as argument to a function or method, or otherwise moved around, a copy of it is actually created and assigned or passed. Note that swift dictionaries are also value types, implemented as structs.
 
 Value types in swift are:
 
 structs (incl. arrays and dictionaries)
 enumerations
 basic data types (boolean, integer, float, etc.)
 */

import UIKit

var array1 = [1,2,3,4,5]
var array2 = array1
array2.append(6)
var length = array2.count