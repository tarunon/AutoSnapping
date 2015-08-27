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
        if CGPointEqualToPoint(velocity, CGPointZero)
            || targetOffset.y > self.contentSize.height - self.frame.size.height - self.contentInset.top - self.contentInset.bottom
            || targetOffset.x > self.contentSize.width - self.frame.size.width - self.contentInset.left - self.contentInset.right {
                return targetOffset
        }
        guard let indexPath = self.indexPathForItemAtPoint(targetOffset)
            , cellLayout = self.layoutAttributesForItemAtIndexPath(indexPath) else {
                return targetOffset
        }
        
        var targetOffset = targetOffset
        
        let targetOffsetXDif = targetOffset.x - cellLayout.frame.minX
        if targetOffsetXDif < roundingWidth {
            targetOffset.x = cellLayout.frame.minX - self.contentInset.left
        } else if targetOffsetXDif > cellLayout.frame.width - roundingWidth {
            targetOffset.x = cellLayout.frame.maxX - self.contentInset.left
        }
        
        let targetOffsetYDif = targetOffset.y - cellLayout.frame.minY
        if targetOffsetYDif < roundingHeight {
            targetOffset.y = cellLayout.frame.minY - self.contentInset.top
        } else if targetOffsetYDif > cellLayout.frame.height - roundingHeight {
            targetOffset.y = cellLayout.frame.maxY - self.contentInset.top
        }
        
        return targetOffset
    }
}

protocol AutoSnappingCollectionViewDelegate: UIScrollViewDelegate {
    var collectionView: UICollectionView! { get set }
}

extension AutoSnappingCollectionViewDelegate {
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.memory = collectionView.autoSnapping(velocity: velocity, targetOffset: targetContentOffset.memory)
    }
}