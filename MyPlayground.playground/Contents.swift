import UIKit
//func printTest2(_ result: @autoclosure () -> Void) {
//    print("Before")
//    result()
//    print("After")
//}
//
//printTest2(print("Hello"))
func printTest1(_ result: () -> Void) {
    print("Before")
    result()
    print("After")
}
printTest1 {
    print("Hello")
}
