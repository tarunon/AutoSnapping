# AutoSnapping
Auto snapping when scroll decelerating in UITableView or UICollectionView

## Demo
Using AutoSnapping / Not at


<img src="https://github.com/tarunon/AutoSnapping/blob/master/readme/enable.gif" width="160"><img src="https://github.com/tarunon/AutoSnapping/blob/master/readme/disable.gif" width="160">

## Sample
```swift
// In your tableView delegate class
func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    self.tableView.autoSnapping(velocity: velocity, targetOffset: targetContentOffset)
}
```

```swift
// In your collectionView delegate class
func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    self.collectionView.autoSnapping(velocity: velocity, targetOffset: targetContentOffset)
}
```

## LICENSE
MIT
