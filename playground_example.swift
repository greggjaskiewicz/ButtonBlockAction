//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    var buttonActions: ButtonBlockAction?
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view

        let buttonFrame = CGRect(x: 150, y: 240, width: 100, height: 40)
        let button = UIButton(frame: buttonFrame)
        button.backgroundColor = .red

        button.setTitle("press me", for: .normal)
        self.view.addSubview(button)

        self.buttonActions = ButtonBlockAction(button: button)
        self.buttonActions?.setBlockAction({
            print("button pressed")

        }, for: .touchUpInside)
    }

    @objc func buttonPress() {
        print("button pressed")
    }
}
// Present the view controller in the Live View window
let controller = MyViewController()

PlaygroundPage.current.liveView = controller
