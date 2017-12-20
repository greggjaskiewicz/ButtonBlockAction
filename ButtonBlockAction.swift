//
//  ButtonBlockAction.swift
//
//  Created by Gregg Jaskiewicz on 20/12/2017.
//  Copyright Gregg Jaskiewicz 2017
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import UIKit

class ButtonBlockAction {
    fileprivate let button: UIButton
    fileprivate var blocksPerAction: [UIControlEvents.RawValue: ()->()] = [:]

    init(button: UIButton) {
        self.button = button

        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
        button.addTarget(self, action: #selector(touchUpOutside), for: .touchUpOutside)
        button.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchCancel), for: .touchCancel)
    }

    @objc func touchDown() {
        if let block = self.blocksPerAction[UIControlEvents.touchDown.rawValue] {
            block()
        }
    }

    @objc func touchUpOutside() {
        if let block = self.blocksPerAction[UIControlEvents.touchUpOutside.rawValue] {
            block()
        }
    }

    @objc func touchUpInside() {
        if let block = self.blocksPerAction[UIControlEvents.touchUpInside.rawValue] {
            block()
        }
    }

    @objc func touchCancel() {
        if let block = self.blocksPerAction[UIControlEvents.touchCancel.rawValue] {
            block()
        }
    }

    func setBlockAction(_ block: @escaping ()->(), for controlEvents: UIControlEvents) {
        self.blocksPerAction[controlEvents.rawValue] = block
    }
}

