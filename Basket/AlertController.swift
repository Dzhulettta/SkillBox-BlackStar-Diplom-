
//import UIKit
//
//
//class AlertController: UIViewController {
//    
//     var delegate: AlertControllerDelegate?
//    
//    func makeAlertControllet(){ // создание алерт контроллера
//           let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert) // создание алерт контроллера
//           
//           alertController.addTextField { textField in
//               textField.placeholder = "Удалить товары из корзины?"
//           }
//           // создание кнопни1
//           let alertAction1 = UIAlertAction(title: "ДА", style: .default) { (alert) in
//            let answer = true
//            self.delegate?.loaded(answer: answer)
//           }
//           // создание кнопки2
//           let alertAction2 = UIAlertAction(title: "НЕТ", style: .cancel) { (alert) in
//                let answer = false
//            self.delegate?.loaded(answer: answer)
//           }
//        
//           // добавление кнопок в алерт контроллер
//           alertController.addAction(alertAction1)
//           alertController.addAction(alertAction2)
//         
//            present(alertController, animated: true, completion:  nil) // вызов алерт контроллера
//       }
//}
