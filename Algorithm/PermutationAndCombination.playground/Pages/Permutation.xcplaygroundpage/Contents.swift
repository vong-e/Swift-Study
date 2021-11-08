import Foundation

//MARK: - For loop를 사용한 조합 찾기

let numberArray: [Int] = [1, 2, 3, 4]

func permutationWithForLoop(array: [Int]) {
    var permutaionArray: [[Int]] = []
    for i in 0..<array.count {
        for j in 0..<array.count {
            for k in 0..<array.count {
                if i==j || j == k || k == i { //중복 제거
                    continue
                }
                //순열 어레이에 i, j, k 번째의 값을 append 시킨다.
                permutaionArray.append([array[i], array[j], array[k]])
            }
        }
    }
    print("4개의 값에서 3개를 고르는 순열의 수: \(permutaionArray.count)개")
    print(permutaionArray)
}

//permutationWithForLoop(array: numberArray)


//MARK: - 재귀함수를 사용한 조합 찾기

let stringArray: [String] = ["A", "B", "C", "D"]
var permutaionArray: [[String]] = [] //찾은 순열을 저장할 배열
let numberOfPick: Int = 2 //몇개로 구성된 순열을 찾을지

func permutaionWithRecursion(array: [String], pickCount: Int, permutationArray: inout [[String]], index: Int = 0) {
    if index == pickCount {
        permutationArray.append(Array(array[0..<index]))
        return
    }
    
    var arr = array
    
    for i in index..<arr.count {
        arr.swapAt(index, i)
        permutaionWithRecursion(array: arr, pickCount: pickCount, permutationArray: &permutationArray, index: index + 1)
        arr.swapAt(index, i)
    }
}

permutaionWithRecursion(array: stringArray, pickCount: numberOfPick, permutationArray: &permutaionArray)
print("4개의 값에서 2개를 고르는 순열의 수: \(permutaionArray.count)개") //12개
print(permutaionArray)
/*
[["A", "B"], ["A", "C"], ["A", "D"],
 ["B", "A"], ["B", "C"], ["B", "D"],
 ["C", "B"], ["C", "A"], ["C", "D"],
 ["D", "B"], ["D", "C"], ["D", "A"]]
 */
