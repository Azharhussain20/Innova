import UIKit

enum AlertButtonType {
    case oneButton(title: String, style: UIAlertAction.Style, handler: (() -> Void)?)
    case twoButtons(button1: (title: String, style: UIAlertAction.Style, handler: (() -> Void)?), button2: (title: String, style: UIAlertAction.Style, handler: (() -> Void)?))
    case moreButtons(buttons: [(title: String, style: UIAlertAction.Style, handler: (() -> Void)?)])
}

func showAlert(title: String?, message: String?, type: AlertButtonType, viewController: UIViewController) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

    switch type {
    case .oneButton(let title, let style, let handler):
        let action = UIAlertAction(title: title, style: style, handler: { _ in handler?() })
        alertController.addAction(action)

    case .twoButtons(let button1, let button2):
        let action1 = UIAlertAction(title: button1.title, style: button1.style, handler: { _ in button1.handler?() })
        let action2 = UIAlertAction(title: button2.title, style: button2.style, handler: { _ in button2.handler?() })
        alertController.addAction(action1)
        alertController.addAction(action2)

    case .moreButtons(let buttons):
        for button in buttons {
            let action = UIAlertAction(title: button.title, style: button.style, handler: { _ in button.handler?() })
            alertController.addAction(action)
        }
    }

    viewController.present(alertController, animated: true, completion: nil)
}

//// Example usage:
//
//let viewController = UIViewController() // Replace this with your actual view controller
//showAlert(
//    title: "Alert Title",
//    message: "Alert Message",
//    type: .moreButtons(buttons: [
//        ("Button 1", .default, { print("Button 1 tapped") }),
//        ("Button 2", .destructive, { print("Button 2 tapped") }),
//        ("Button 3", .cancel, { print("Button 3 tapped") })
//    ]),
//    viewController: viewController
//)
