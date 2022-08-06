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

class SelectionViewController: UIViewController {
    
    lazy var list: [MaterialColorDataSource.Color] = {
        (0...2).map { _ in
            MaterialColorDataSource.generateSingleSectionData()
        }.reduce([], +)
    }()
    
    lazy var checkImage: UIImage? = UIImage(systemName: "checkmark.circle")
    
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    func selectRandomItem() {
        
        let item = Int.random(in: 0..<list.count)
        let targetIndexPath = IndexPath(item: item, section: 0)
        
        listCollectionView.selectItem(at: targetIndexPath, animated: true, scrollPosition: .centeredHorizontally)
        
        let color = list[item].color
        view.backgroundColor = color
    }
    
    // 모든 선택 스크롤 위치 초기화
    func reset() {
        
        // 하나만 해제하는 경우
//        listCollectionView.deselectItem(at: <#T##IndexPath#>, animated: <#T##Bool#>)
        
        listCollectionView.selectItem(at: nil, animated: true, scrollPosition: .left)
        
        let firstIndexPath = IndexPath(item: 0, section: 0)
        listCollectionView.scrollToItem(at: firstIndexPath, at: .left, animated: true) // scroll
        
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showMenu))
        
        listCollectionView.allowsSelection = true // single Selction모드 설정
        listCollectionView.allowsMultipleSelection =  false // Multi Selection 모드 설정
    }
}

extension SelectionViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        
        print("#3", indexPath, #function)
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
        print("#4", indexPath, #function)
        
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.layer.borderWidth = 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        
        print("#5", indexPath, #function)
        
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.layer.borderWidth = 0
        }
    }
    
    // cell을 선택했을 때 해당 메소드가 불린다.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("#1", indexPath, #function)
        
        let color = list[indexPath.item].color
        view.backgroundColor = color
        
//        if let cell = collectionView.cellForItem(at: indexPath) {
//
//            if let imageView = cell.contentView.viewWithTag(100) as? UIImageView {
//                imageView.image = checkImage
//            }
//        }
    }
    
    // cell을 누르기 직전에 Bool값을 알려준다.
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        print("#2", indexPath, #function)
        
        guard let list = collectionView.indexPathsForSelectedItems else {
            return true
        }
        
        return !list.contains(indexPath)
    }
    
    // 선택하기 전에 해당 메서드를 사용한다. (Alert창 경고)
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 실제로 선택이 완료된 이후 해당 메서드를 탄다. (UI변경)
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
//        if let cell = collectionView.cellForItem(at: indexPath) {
//
//            if let imageView = cell.contentView.viewWithTag(100) as? UIImageView {
//                imageView.image = nil
//            }
//        }
    }
}

extension SelectionViewController: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = list[indexPath.row].color
        
        return cell
    }
}




extension SelectionViewController {
    
    @objc func showMenu() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let randomAction = UIAlertAction(title: "Select Random Item", style: .default) { [weak self] (action) in
            self?.selectRandomItem()
        }
        actionSheet.addAction(randomAction)
        
        let resetPositionAction = UIAlertAction(title: "Reset", style: .default) { [weak self] (action) in
            self?.reset()
        }
        actionSheet.addAction(resetPositionAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(cancelAction)
        
        present(actionSheet, animated: true, completion: nil)
    }
}










