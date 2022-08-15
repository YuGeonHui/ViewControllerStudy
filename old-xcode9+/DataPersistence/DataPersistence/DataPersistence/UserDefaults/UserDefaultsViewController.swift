//
//  Copyright (c) 2019 KxCoding <kky0317@gmail.com>
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

class UserDefaultsViewController: UIViewController {
    
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var lastUpdatedLabel: UILabel!
    
    func updateDateLabel() {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        
        lastUpdatedLabel.text = formatter.string(from: Date())
    }
    
    let key = "sampleKEy"
    
    @IBAction func saveData(_ sender: Any) {
        
        // 값을 저장 UserDefaults
        // Singleton Instance를 사용한다.
//        UserDefaults.standard.set("Hello", forKey: key)
        UserDefaults.standard.set(12.34, forKey: key)
    }
    
    @IBAction func loadData(_ sender: Any) {
//        valueLabel.text = UserDefaults.standard.string(forKey: key) ?? "Not set"
//        valueLabel.text = "\(UserDefaults.standard.integer(forKey: key))"
        valueLabel.text = "\(UserDefaults.standard.integer(forKey: thresholdkey))"
        keyLabel.text = key
    }
    
    var token: NSObjectProtocol?
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        token = NotificationCenter.default.addObserver(forName: UserDefaults.didChangeNotification, object: nil, queue: OperationQueue.main, using: { [weak self] noti in
//            self?.updateDateLabel()
//        })
        // UserDefaults에 있는 모든 원소 딕셔너리 형태로 출력
        print(UserDefaults.standard.dictionaryRepresentation())
        
        // UserDefaults에서 해당되는 key만 찾아서 출력해준다. (딕셔너리 형태)
        print(UserDefaults.standard.dictionaryWithValues(forKeys: [key]))
        
        // UserDefaults에서 값을 제거하는 방법
        UserDefaults.standard.set(nil, forKey: key)
        UserDefaults.standard.removeObject(forKey: key)
    }
}
