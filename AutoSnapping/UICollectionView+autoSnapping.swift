//
//  UICollectionView+autoSnapping.swift
//  AutoSnapping
//
//  Created by Nobuo Saito on 2015/08/20.
//  Copyright © 2015 tarunon. All rights reserved.
//

import Foundation

private let roundingWidth: CGFloat = 160.0
private let roundingHeight: CGFloat = 160.0

public extension UICollectionView {
    func autoSnapping(velocity velocity: CGPoint, targetOffset: CGPoint) -> CGPoint {
        if CGPointEqualToPoint(velocity, CGPointZero) || targetOffset.y > self.contentSize.height - self.frame.size.height - self.contentInset.top - self.contentInset.bottom {
            return targetOffset
        }
        guard let indexPath = self.indexPathForItemAtPoint(targetOffset)
            , cell = self.cellForItemAtIndexPath(indexPath) else {
                return targetOffset
        }
        
        var targetOffset = targetOffset
        
        let cellOffsetX = cell.frame.origin.x
        let cellWidth = cell.frame.width
        let targetOffsetXDif = targetOffset.x - cellOffsetX
        if targetOffsetXDif < roundingWidth {
            targetOffset.x = cellOffsetX
        } else if targetOffsetXDif > cellWidth - roundingWidth {
            targetOffset.x = cellOffsetX + cellWidth
        }
        
        let cellOffsetY = cell.frame.origin.y
        let cellHeight = cell.frame.height
        let targetOffsetYDif = targetOffset.y - cellOffsetY
        if targetOffsetYDif < roundingHeight {
            targetOffset.y = cellOffsetY
        } else if targetOffsetYDif > cellHeight - roundingHeight {
            targetOffset.y = cellOffsetY + cellHeight
        }
        
        return targetOffset
    }
}