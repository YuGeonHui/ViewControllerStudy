//
//  Mastering iOS
//  Copyright (c) KxCoding <help@kxcoding.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
import UIKit

class ReorderingViewController: UIViewController {
    
    var list = MaterialColorDataSource.generateMultiSectionData()
    
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    @IBAction func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        
        let location = sender.location(in: listCollectionView)
        
        switch sender.state {
        case .began:
            if let indexPath = listCollectionView.indexPathForItem(at: location) {
                listCollectionView.beginInteractiveMovementForItem(at: indexPath)
            }
        case .changed:
            listCollectionView.updateInteractiveMovementTargetPosition(location)
            
        case .ended:
            
            listCollectionView.endInteractiveMovement()
            
        default:
            
            listCollectionView.cancelInteractiveMovement()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}



extension ReorderingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let target = list[sourceIndexPath.section].colors.remove(at: sourceIndexPath.item)
        
        list[destinationIndexPath.section].colors.insert(target, at: destinationIndexPath.item)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return list.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list[section].colors.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = list[indexPath.section].colors[indexPath.row]
        
        return cell
    }
}





