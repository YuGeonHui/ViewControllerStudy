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

class FlowLayoutViewController: UIViewController {
    
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    let list = MaterialColorDataSource.generateMultiSectionData()
    
    @objc func toggleScrollDirection() {
        
        // 스크롤 방향 Toggle하는 방법
        // layout의 속성은 collectionView자체의 속성이 아니기 때문에 casting 해준다.
        guard let layout = listCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        listCollectionView.performBatchUpdates { // 애니메이션 추가
            layout.scrollDirection = layout.scrollDirection == .vertical ? .horizontal : .vertical
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleScrollDirection))
        
        if let layout = listCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
            // MARK: - Cell크기 변경
            layout.itemSize = CGSize(width: 100, height: 100)
            
            // MARK: - Cell 라인 여백, 셀 여백(수직, 수평에 따라 둘이 달라진다.)
            layout.minimumInteritemSpacing = 5
            layout.minimumLineSpacing = 5
            
            // MARK: - Section Inset (항상 같은 값을 유지한다.)
            layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        }
    }
}

// MARK: - Flow Layout 관련 Delegate
extension FlowLayoutViewController: UICollectionViewDelegateFlowLayout {
    
    // 크기를 파악하기 위해서 (StoryBoard보다 우선순위가 높다.)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("#1", #function)
        
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return .zero
        }
        
        var bounds = collectionView.bounds // 컬렉션 뷰 크기를 변수로 설정
        debugPrint("bounds : \(bounds)")
        bounds.size.height += bounds.origin.y
        
        var width = bounds.width - (layout.sectionInset.left + layout.sectionInset.right)
        var height = bounds.height - (layout.sectionInset.top + layout.sectionInset.bottom)
        
        debugPrint("width : \(width)")
        debugPrint("height : \(height)")
        
        
        switch layout.scrollDirection {
            
        case .vertical:
            
            // 셀 높이를 5등분 한다. (lineSpacing을 빼고)
            height = (height - (layout.minimumLineSpacing * 4)) / 5
            
            if indexPath.item > 0 {
                width = (width - (layout.minimumInteritemSpacing * 2)) / 3
            }
            
        case .horizontal:
            
            width = (width - (layout.minimumLineSpacing * 2)) / 3
            
            if indexPath.item > 0 {
                height = (height - (layout.minimumInteritemSpacing * 4)) / 5
            }
        }
        
        return CGSize(width: width.rounded(.down), height: height.rounded(.down))
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        print("#2", #function)
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        print("#3", #function)
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        print("#4", #function)
//        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//    }
}


extension FlowLayoutViewController: UICollectionViewDataSource {
    
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
















