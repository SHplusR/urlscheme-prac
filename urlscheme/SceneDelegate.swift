//
//  SceneDelegate.swift
//  urlscheme
//
//  Created by HYORI SIM on 2022/09/15.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else { return }
        //ioshr://navagation?name=jake&age=8
        let urlstring = url.absoluteString

        print("url scheme : %@",url.scheme) //ioshr
        print(url.host) //navagation
        print(urlstring) //ioshr://navagation?name=jake&age=8
        print(url.query) //name=jake&age=8
    
        let components = URLComponents(string: urlstring)
        let urlquery = components?.queryItems ?? []
        print(urlquery)
     
        var dictionaryData = [String: String]()
        urlquery.forEach { dictionaryData[$0.name] = $0.value }
        print(dictionaryData)
        let agevalue = urlquery[1].value
        print(agevalue)
        connectStoryboard(url: url)
        
        
    
      }
    
    func connectStoryboard (url : URL)
    {
        let urlstring = url.absoluteString
        let components = URLComponents(string: urlstring)
        let urlquery = components?.queryItems ?? []
        var agevalue = urlquery[1].value ?? ""
        var namevalue = urlquery[0].value ?? ""
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let rootVC = storyboard.instantiateViewController(identifier: "MainVC") as? MainController
                else {
                    print("뷰 컨트롤러 확인 실패")
                    return
                }
            
                let rootNC = UINavigationController(rootViewController: rootVC)
                self.window?.rootViewController = rootNC
                self.window?.makeKeyAndVisible()
        
        let topViewController = self.window?.rootViewController as? UINavigationController
        let currentVC = topViewController?.topViewController as? MainController
                        
                        // 뷰 컨트롤러 : url 스키마로 접속을 체크하는 곳으로 데이터 전송
        currentVC?.urlSchemeCheck(_name: namevalue, _age: agevalue)
    
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

