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
    func autoSnapping(velocity velocity: CGPoint, targetOffset: UnsafeMutablePointer<CGPoint>) {
        if CGPointEqualToPoint(velocity, CGPointZero)
            || targetOffset.memory.y > self.contentSize.height - self.frame.size.height - self.contentInset.top - self.contentInset.bottom
            || targetOffset.memory.x > self.contentSize.width - self.frame.size.width - self.contentInset.left - self.contentInset.right {
                return
        }
        guard let indexPath = self.indexPathForItemAtPoint(targetOffset.memory)
            , cellLayout = self.layoutAttributesForItemAtIndexPath(indexPath) else {
                return
        }
        
        var offset = targetOffset.memory
        
        let targetOffsetXDif = offset.x - cellLayout.frame.minX
        if targetOffsetXDif < roundingWidth {
            offset.x = cellLayout.frame.minX - self.contentInset.left
        } else if targetOffsetXDif > cellLayout.frame.width - roundingWidth {
            offset.x = cellLayout.frame.maxX - self.contentInset.left
        }
        
        let targetOffsetYDif = offset.y - cellLayout.frame.minY
        if targetOffsetYDif < roundingHeight {
            offset.y = cellLayout.frame.minY - self.contentInset.top
        } else if targetOffsetYDif > cellLayout.frame.height - roundingHeight {
            offset.y = cellLayout.frame.maxY - self.contentInset.top
        }
        targetOffset.memory = offset
    }
}
