//
//  Global.swift
//  Koupgon
//
//  Created by Mobile on 2017-01-18.
//  Copyright © 2017 genozhou. All rights reserved.
//

import Foundation

enum UserDefaultKey: String {
    case defaultStoreName
}

func dPrint(_ item: @autoclosure () -> Any) {
    #if DEBUG
    print(item())
    #endif
}

func measure(f: () -> ()) {
    let start = CFAbsoluteTimeGetCurrent()
    f()
    let end = CFAbsoluteTimeGetCurrent()
    print("Time cost: \(end - start)")
}
