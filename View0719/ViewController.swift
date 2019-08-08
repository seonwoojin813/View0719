//
//  ViewController.swift
//  View0719
//
//  Created by Woojin on 19/07/2019.
//  Copyright © 2019 Woojin. All rights reserved.
//

import UIKit

//class ViewController: UIViewController{
//class ViewController: UIViewController, UITextFieldDelegate {
class ViewController: UIViewController{
    /*
    //Return 키를 누르면 호출되는 메소드
    //어떤 동작을 취했을 떄 Bool을 리턴하는 메소드
    //리턴 값이 원래 지정된 동작의 수행 여부인 경우가 많습니다.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        input.resignFirstResponder()
        return true
    }
     //이걸 밑으로 옮기기
 */

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var input: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func click(_ sender: Any) {
        display.text = input.text
        input.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //텍스트 필드의 Delegate 설정
        input.delegate = self
        
        //input이 FirstResponder가 되도록 설정
        input.becomeFirstResponder()
        
        
       //var timer = Timer(timeInterval: 1, repeats: true, block:
        //위처럼 쓰면 timer.fire()을 해줘야 해
        
        //timer를 생성자로 만들면 fire()를 호출해야 하고
        //static 메소드를 이용하면 바로 시작
         Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block:
            {(timer:Timer) -> Void in
               //현재 시간 가져오기
                let date = Date()
                //날짜를 문자열로 만들어주는 클래스의 인스턴스 생성
                let formatter = DateFormatter()
                //포맷 설정
                formatter.dateFormat = "yyyy-MM-dd ccc hh:mm:ss"
                //출력 내용 만들기
                let msg = formatter.string(from: date)
                //레이블에 msg를 출력
                //클러저 안에서 인스턴스 변수를 사용할 때는 self.을 추가해야 합니다.
                //label.text = msg -> 에러
                self.label.text = msg
                
                //레이블의 경계선 설정
                //뷰의 속성으로 설정이 안되는 UI는 layer 속성 이용
                self.label.layer.borderWidth = 5
                self.label.layer.borderColor =
                UIColor.red.cgColor
        })
        //timer.fire()
    
 
        NotificationCenter.default.addObserver(self,
        selector: #selector(KeyboardShow(notification:)),
        name: UIResponder.keyboardWillShowNotification,
        object: nil)
        
        NotificationCenter.default.addObserver(self,
        selector: #selector(KeyboardHide(notification:)),
        name: UIResponder.keyboardWillHideNotification,
        object: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        input.resignFirstResponder()
    }

    // Keyboard 가 보여질 때 호출되는 Method
    @objc func KeyboardShow(notification:NSNotification){
    var frame = button.frame
    frame.origin.y = frame.origin.y - 200
    button.frame = frame
}

// Keyboard 가 사라질 때 호출되는 Method
@objc func KeyboardHide(notification:NSNotification){
    var frame = button.frame
    frame.origin.y = frame.origin.y + 200
    button.frame = frame
   }
}
extension ViewController : UITextFieldDelegate{
    //Return 키를 누르면 호출되는 메소드
    //어떤 동작을 취했을 떄 Bool을 리턴하는 메소드
    //리턴 값이 원래 지정된 동작의 수행 여부인 경우가 많습니다.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        input.resignFirstResponder()
        return true
    }

}
