//
//  SRMethod.swift
//  XcodeBefore13
//
//  Created by ruixinyi on 2021/3/23.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

import Foundation

class SRMethod: NSObject {
    @objc public class func SumMethd(A: Int, B: Int) -> Int {
        let sum = A + B;
        print("sum is \(sum)")
        return sum
    }
    
    @objc public func subMethod(A: Int, B: Int) -> Int {
        let sub = A - B;
        print("sub is \(sub)")
        return sub
    }
    
    @objc public func methodWithBlock(A: Int, callBack:@escaping((_ code: Int, _ result: String) -> ())) {
        callBack(A + 1, "Block successed!");
    }
}
