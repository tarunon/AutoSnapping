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
    func autoSnapping(velocity velocity: CGPoint, targetOffset: CGPoint) -> CGPoint {
        if CGPointEqualToPoint(velocity, CGPointZero) || targetOffset.y > self.contentSize.height - self.frame.size.height - self.contentInset.top - self.contentInset.bottom {
            return targetOffset
        }
        guard let indexPath = self.indexPathForRowAtPoint(targetOffset) else {
                return targetOffset
        }
        
        var targetOffset = targetOffset
        let cellRect = self.rectForRowAtIndexPath(indexPath)
        
        let targetOffsetYDif = targetOffset.y - cellRect.minY
        if targetOffsetYDif < roundingHeight {
            targetOffset.y = cellRect.minY
        } else if targetOffsetYDif > cellRect.height - roundingHeight {
            targetOffset.y = cellRect.maxY
        }
        
        return targetOffset
    }
}