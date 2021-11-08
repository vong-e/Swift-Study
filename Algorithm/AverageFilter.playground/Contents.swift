//Average Filter (평균 필터)
import UIKit

func runningTime(runningFunction: () -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    runningFunction()
    let runningTime = CFAbsoluteTimeGetCurrent() - startTime
    print("* Running Time: \(runningTime)")
}
이거 왜 더오래걸려;; 다시만들기

func getAveragWithGeneral(arr: [Int]) -> CGFloat {
    return CGFloat(arr.reduce(0) {$0 + $1}) / CGFloat(arr.count)
}

func getAverageWithAverageFilter(arr: [Int]) -> CGFloat{
    var average: CGFloat = 0
    for i in 0..<arr.count {
        average = calculateAverage(previousAverag: average, newValue: CGFloat(arr[i]), listLength: CGFloat(i+1))
    }
    return average
}

func calculateAverage(previousAverag: CGFloat, newValue: CGFloat, listLength: CGFloat) -> CGFloat { //param: 이전 평균값, 새로 들어온 값, 리스트 길이
    let previousWeight: CGFloat = (listLength - 1) / listLength
    let newWeight: CGFloat = 1 / listLength
    return CGFloat(previousAverag * previousWeight) + CGFloat(newValue * newWeight)
}

let intArray = [2,42,53,47,556,61,72,86,14,54,33,787,665,331,57,8885,2134,123,555,
                2,42,53,47,556,61,72,86,14,54,33,787,665,331,57,8885,2134,123,555,
                2,42,53,47,556,61,72,86,14,54,33,787,665,331,57,8885,2134,123,555,
                2,42,53,47,556,61,72,86,14,54,33,787,665,331,57,8885,2134,123,555,
                2,42,53,47,556,61,72,86,14,54,33,787,665,331,57,8885,2134,123,555]

runningTime {
    print("* 일반적인 평균값 구하기")
    let avg = getAveragWithGeneral(arr: intArray)
    print("* 평균: \(avg)")
}

print("====================")

runningTime {
    print("* 평균 필터를 사용한 평균값 구하기")
    let avg = getAverageWithAverageFilter(arr: intArray)
    print("* 평균: \(avg)")
}
