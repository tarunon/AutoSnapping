# AutoSnapping
Auto snapping when scroll decelerating in UITableView or UICollectionView

## Demo
Using AutoSnapping / Not at


<img src="https://github.com/tarunon/AutoSnapping/blob/master/readme/enable.gif" width="160"><img src="https://github.com/tarunon/AutoSnapping/blob/master/readme/disable.gif" width="160">

## Sample
```swift
// In your tableView delegate class
func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    targetContentOffset.memory = self.tableView.autoSnapping(velocity: velocity, targetOffset: targetContentOffset.memory)
}
```

```swift
// In your collectionView delegate class
func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    targetContentOffset.memory = self.collectionView.autoSnapping(velocity: velocity, targetOffset: targetContentOffset.memory)
}
```

## LICENSE
MIT
