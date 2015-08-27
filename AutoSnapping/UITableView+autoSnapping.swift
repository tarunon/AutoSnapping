//
//  UITableView+autoSnapping.swift
//  AutoSnapping
//
//  Created by Nobuo Saito on 2015/08/20.
//  Copyright © 2015 tarunon. All rights reserved.
//

import Foundation

private let roundingHeight: CGFloat = 160.0

public extension UITableView {
    func autoSnapping(velocity velocity: CGPoint, targetOffset: UnsafeMutablePointer<CGPoint>) {
        if CGPointEqualToPoint(velocity, CGPointZero) || targetOffset.memory.y > self.contentSize.height - self.frame.size.height - self.contentInset.top - self.contentInset.bottom {
            return
        }
        guard let indexPath = self.indexPathForRowAtPoint(targetOffset.memory) else {
            return
        }
        
        var offset = targetOffset.memory
        let cellRect = self.rectForRowAtIndexPath(indexPath)
        
        let targetOffsetYDif = offset.y - cellRect.minY
        if targetOffsetYDif < roundingHeight {
            offset.y = cellRect.minY - self.contentInset.top
        } else if targetOffsetYDif > cellRect.height - roundingHeight {
            offset.y = cellRect.maxY - self.contentInset.top
        }
        targetOffset.memory = offset
    }
}
