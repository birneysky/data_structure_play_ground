//
//  Performance.swift
//  Collections
//
//  Created by birney on 2019/12/13.
//

import Foundation


public func dumpMeasureInfo(_ description: String, _ block:() -> Void) {
    let startTime = clock()
    block()
    let endTime = clock()
    let  duration = (Double)(endTime - startTime) / ((Double)(CLOCKS_PER_SEC) * 1.0);
    NSLog("≞≞≞≞ \(description) took \(duration) seconds ≞≞≞≞");
}
