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
        guard let indexPath = self.indexPathForRowAtPoint(targetOffset)
            , cell = self.cellForRowAtIndexPath(indexPath) else {
                return targetOffset
        }
        let cellOffset = cell.frame.origin.y
        let cellHeight = cell.frame.height
        let targetOffsetDif = targetOffset.y - cellOffset
        if targetOffsetDif < roundingHeight {
            return CGPoint(x: targetOffset.x, y: cellOffset)
        } else if targetOffsetDif > cellHeight - roundingHeight {
            return CGPoint(x: targetOffset.x, y: cellOffset + cellHeight)
        } else {
            return targetOffset
        }
    }
}