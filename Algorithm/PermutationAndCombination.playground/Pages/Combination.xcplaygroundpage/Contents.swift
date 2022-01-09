import Foundation

//MARK: - For loop를 사용한 순열 찾기

let numberArray: [Int] = [1, 2, 3, 4]

func combinationWithForLoop(array: [Int]) -> [[Int]] {
    var combinationArray: [[Int]] = []

    for i in 0..<array.count {
        for j in (i+1)..<array.count {
            for k in (j+1)..<array.count {
                combinationArray.append([array[i], array[j], array[k]])
            }
        }
    }
    return combinationArray
}
//print("4개의 값에서 3개를 고르는 조합의 수 : \(combinationWithForLoop(array: numberArray).count)")
//print(combinationWithForLoop(array: numberArray))
/*
 [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
 */


//MARK: - 재귀함수를 사용한 순열 찾기
let intArray: [Int] = [1, 2, 3, 4]
var combinationArray: [[Int]] = []
let numberOfPick: Int = 2

func combinationWithRecursion(array: [Int], pickCount: Int, index: Int = 0, tempArray: [Int], combsArray: inout [[Int]]) -> [[Int]] {
    if tempArray.count == pickCount {
        combsArray.append(tempArray)
        return []
    }

    for i in index..<array.count {
        combinationWithRecursion(array: array, pickCount: pickCount, index: i + 1, tempArray: tempArray + [array[i]], combsArray: &combsArray)
    }

    return combsArray
}

combinationWithRecursion(array: intArray, pickCount: numberOfPick, tempArray: [], combsArray: &combinationArray)
print("4개의 값에서 2개를 고르는 조합의 수: \(combinationArray.count)개") //6개
print(combinationArray)
/*
 [[1, 2], [1, 3], [1, 4],
 [2, 3], [2, 4],
 [3, 4]]
 */
