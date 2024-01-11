//
//  ViewController.swift
//  AsyncAwaitTest
//
//  Created by home on 2024/01/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        executeBothTask { total in
//            print("total: \(total)")
//        }
        
        Task {
            let total = await executeBothTask()
            print("total: \(total)")
        }
    }

//    func executeBothTask(completion: @escaping (Int) -> Void) {
//        task1 { [weak self] num1 in
//            self?.task2 { num2 in
//                completion(num1 + num2)
//            }
//        }
//    }
//    
//    private func task1(completion: @escaping (Int) -> Void) {
//        sleep(1)
//        print("タスク1完了")
//        completion(2)
//    }
//    
//    private func task2(completion: @escaping (Int) -> Void) {
//        sleep(2)
//        print("タスク2完了")
//        completion(3)
//    }
    
    private func task1() async -> Int {
        sleep(1)
        print("タスク1完了")
        return 3
    }
    
    private func task2() async -> Int {
        sleep(2)
        print("タスク2完了")
        return 1
    }
    
    func executeBothTask() async -> Int {
        let num1 = await task1()
        let num2 = await task2()
        return num1 + num2
    }
}

