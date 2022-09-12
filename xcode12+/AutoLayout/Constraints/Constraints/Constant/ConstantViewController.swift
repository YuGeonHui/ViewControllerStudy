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

class ConstantViewController: UIViewController {

    @IBOutlet weak var blueView: UIView!
    
    @IBOutlet weak var blueViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var blueViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var blueViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var blueViewHeightConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var grayButton: UIButton!
    @IBOutlet weak var grayButtonBottomConstraint: NSLayoutConstraint!
    
    
    @IBAction func updateConstant(_ sender: Any) {
        
        // x,y 좌표 변경, 너비 높이 변경 (제약이 존재하는 경우 적용되지 않는다.)
        // blueView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        
        // 제약을 outlet으로 지정하고, constant를 입력해준다.
        blueViewLeadingConstraint.constant = 100
        blueViewTopConstraint.constant = 100
        
        blueViewWidthConstraint.constant = 200
        blueViewHeightConstraint.constant = 200
        
        print(#function)
        
        let buttonHeight = grayButton.frame.height
        
        if grayButtonBottomConstraint.constant < 0 {
            grayButtonBottomConstraint.constant = 0
        } else {
            grayButtonBottomConstraint.constant = (-view.frame.height / 2) + buttonHeight
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
