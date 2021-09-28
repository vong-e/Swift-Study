import Foundation

/*
 For loop를 사용한 순열 찾기
 */
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
    print("4개의 값에서 3개를 고르는 경우의 수: \(permutaionArray.count)개")
    print(permutaionArray)
}

//permutationWithForLoop(array: numberArray)


/*
 재귀를 사용한 순열 찾기
 */
let stringArray: [String] = ["A", "B", "C", "D"]
var permutaionArray: [[String]] = [] //찾은 순열을 저장할 배열
var numberOfPick: Int = 3 //몇개로 구성된 순열을 찾을지

func permutaionWithRecursive(array: [String], pickCount: Int, permutationArray: inout [[String]], index: Int = 0) {
    if index == pickCount {
        permutationArray.append(Array(array[0..<index]))
        return
    }
    
    var arr = array
    
    for i in index..<arr.count {
        arr.swapAt(index, i)
        permutaionWithRecursive(array: arr, pickCount: pickCount, permutationArray: &permutationArray, index: index + 1)
        arr.swapAt(index, i)
    }
}

//permutaionWithRecursive(array: stringArray, pickCount: numberOfPick, permutationArray: &permutaionArray)
//print("4개의 값에서 3개를 고르는 경우의 수: \(permutaionArray.count)개") //24개
//print(permutaionArray)
/*
[["A", "B", "C"], ["A", "B", "D"], ["A", "C", "B"], ["A", "C", "D"], ["A", "D", "C"], ["A", "D", "B"],
 ["B", "A", "C"], ["B", "A", "D"], ["B", "C", "A"], ["B", "C", "D"], ["B", "D", "C"], ["B", "D", "A"],
 ["C", "B", "A"], ["C", "B", "D"], ["C", "A", "B"], ["C", "A", "D"], ["C", "D", "A"], ["C", "D", "B"],
 ["D", "B", "C"], ["D", "B", "A"], ["D", "C", "B"], ["D", "C", "A"], ["D", "A", "C"], ["D", "A", "B"]]
 */
