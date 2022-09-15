//
//  ViewController.swift
//  urlscheme
//
//  Created by HYORI SIM on 2022/09/15.
//

import UIKit

class MainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    func urlSchemeCheck(_name : String, _age : String){
           print("")
           print("===============================")
           print("[MainController > urlSchemeCheck() : 스키마 접속 체크 및 파라미터 정보 확인 실시]")
           print("_name : ", _name)
           print("_age : ", _age)
           print("===============================")
           print("")
           
           // 팝업창 호출 실시 [필요 시 데이터를 받아서 다른 로직 처리 가능]
           self.showAlert(tittle: "[스키마 정보]", content: "이름 : \(_name)  /  나이 : \(_age)", okBtb: "확인", noBtn: "")
       }
    
    func showAlert(tittle:String, content:String, okBtb:String, noBtn:String) {
            // [UIAlertController 객체 정의 실시]
            let alert = UIAlertController(title: tittle, message: content, preferredStyle: UIAlertController.Style.alert)
            
            // [인풋으로 들어온 확인 버튼이 nil 아닌 경우]
            if(okBtb != "" && okBtb.count>0){
                let okAction = UIAlertAction(title: okBtb, style: .default) { (action) in
                    // [확인 버튼 클릭 이벤트 내용 정의 실시]
                    return
                }
                alert.addAction(okAction) // 버튼 클릭 이벤트 객체 연결
            }
            
            // [인풋으로 들어온 취소 버튼이 nil 아닌 경우]
            if(noBtn != "" && noBtn.count>0){
                let noAction = UIAlertAction(title: noBtn, style: .default) { (action) in
                    // [취소 버튼 클릭 이벤트 내용 정의 실시]
                    return
                }
                alert.addAction(noAction) // 버튼 클릭 이벤트 객체 연결
            }
            
            // [alert 팝업창 활성 실시]
            present(alert, animated: false, completion: nil)
        }

}

