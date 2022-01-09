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
let stringArray: [String] = ["A", "B", "C", "D"]
var combinationArray: [[String]] = []
let numberOfPick: Int = 2

func combinationWithRecursion<T>(array: [T], pickCount: Int, currentIndex: Int, tempArray: [T], combsArray: inout [[T]]) -> [[T]] {
    if tempArray.count == pickCount {
        print("템프어레이랑 픽카운트 같음: \(tempArray)")
        combsArray.append(tempArray)
        return []
    }

    for i in currentIndex..<array.count {
        combinationWithRecursion(array: array, pickCount: pickCount, currentIndex: i + 1, tempArray: tempArray + [array[i]], combsArray: &combsArray)
    }

    return combsArray
}

print("Combination with recursion: \(combinationWithRecursion(array: stringArray, pickCount: numberOfPick, currentIndex: 0, tempArray: [], combsArray: &combinationArray))")
