//
//  SceneDelegate.swift
//  ProductStore
//
//  Created by Luan Gomes on 31/01/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let safeWindow = UIWindow(windowScene: windowScene)
        safeWindow.frame = UIScreen.main.bounds
        safeWindow.rootViewController = buidTabBarController()
        safeWindow.makeKeyAndVisible()
        
        window = safeWindow
        
    }
    
    func buidTabBarController() -> UITabBarController {
        let tabBarVc = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: ProductDetailViewController(productId: "asd"))
        let vc2 = SecondViewController()
        let vc3 = ThirdViewController()
        let vc4 = FourthViewController()
        
        
        vc1.title = "Início"
        vc2.title = "Busca"
        vc3.title = "Pedidos"
        vc4.title = "Mais"
        
        
        tabBarVc.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
        
        let images = ["house", "magnifyingglass", "list.bullet.rectangle.portrait", "list.dash"]
        
        tabBarVc.tabBar.items?.enumerated().forEach({ x, n  in   //
            n.image = UIImage(systemName: images[x])
        })
        
        return tabBarVc
    }
        
}
    
    

//controladores de exibiçao para o controlador de barras de guia :


class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Início"
    }
}

class SecondViewController: UIViewController {
override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .lightGray
    title = "Busca"
}
}

class ThirdViewController: UIViewController {
override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .purple
    title = "Pedidos"
}
}

class FourthViewController: UIViewController {
override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .green
    title = "Mais"
}

}

