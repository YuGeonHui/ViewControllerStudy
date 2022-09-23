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

class BasicsViewController: UIViewController {
    
    var redView: UIView!
    var greenView: UIView!
    var blueView: UIView!
    var yellowView: UIView!
    var titleLabel: UILabel!
    var grayView: UIView!

    // 제약을 만든다음 반드시 활성해야 한다. active
    // 재약을 추가하기전에 뷰 계층애 추가해줘야 한다.
    // 자동생성제약, 우리가만든 제약 충돌하기 때문에 translatesAutoresizingMaskIntoConstraints = false
    
    fileprivate func addRedView() {
        
        redView = UIView(frame: .zero)
        redView.backgroundColor = .systemRed
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(redView)
        
        guard let redView = redView else { return }
        
        let leadingConstraint = NSLayoutConstraint(item: redView, attribute: .leading, relatedBy: .equal, toItem: view.layoutMarginsGuide, attribute: .leading, multiplier: 1.0, constant: 0)
        leadingConstraint.isActive = true
        
        let topConstraints = redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        topConstraints.isActive = true
        
        let widthConstraint = NSLayoutConstraint(item: redView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        
        widthConstraint.isActive = true
        
        let heightConstraint = redView.heightAnchor.constraint(equalToConstant: 100)
        heightConstraint.isActive = true
    }
    
    func addGreenView() {
        
        greenView = UIView(frame: .zero)
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(greenView)
        
        guard let greenView = greenView else { return }
        
        let views: [String: Any] = ["greenView" : greenView]
        
        var format = "V:|-[greenView(100)]"
        
        let vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(vertConstraints)
        
        format = "[greenView(100)]-|"
        let horiConstraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(horiConstraints)
    }
    
    func addBlueView() {
    
        blueView = UIView(frame: .zero)
        blueView.backgroundColor = .blue
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(blueView)
        
        guard let blueView = blueView else { return }
        
        let views: [String: Any] = ["blueView" : blueView]
        
        var format = "V:[blueView(100)]-|"
        
        let vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(vertConstraints)
        
        format = "|-[blueView(100)]"
        let horiConstraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(horiConstraints)
    }
    
    func addYellowView() {
        
        yellowView = UIView(frame: .zero)
        yellowView.backgroundColor = .yellow
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(yellowView)
        
        yellowView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        yellowView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        yellowView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        yellowView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        addRedView()
        addGreenView()
        addBlueView()
        addYellowView()
    }
}
