// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit

// swiftlint:disable file_length
// swiftlint:disable line_length
// swiftlint:disable type_body_length

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: nil)
  }

  static func initialViewController() -> UIViewController {
    guard let vc = storyboard().instantiateInitialViewController() else {
      fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
    }
    return vc
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewController(withIdentifier: self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func performSegue<S: StoryboardSegueType>(segue: S, sender: AnyObject? = nil) where S.RawValue == String {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}

struct StoryboardScene {
  enum LaunchScreen: StoryboardSceneType {
    static let storyboardName = "LaunchScreen"
  }
  enum Main: String, StoryboardSceneType {
    static let storyboardName = "Main"

    case BrowseScene = "Browse"
    static func instantiateBrowse() -> Koupgon.BrowseTableViewController {
      guard let vc = StoryboardScene.Main.BrowseScene.viewController() as? Koupgon.BrowseTableViewController
      else {
        fatalError("ViewController 'Browse' is not of the expected class Koupgon.BrowseTableViewController.")
      }
      return vc
    }

    case DetailScene = "Detail"
    static func instantiateDetail() -> Koupgon.DetailTableViewController {
      guard let vc = StoryboardScene.Main.DetailScene.viewController() as? Koupgon.DetailTableViewController
      else {
        fatalError("ViewController 'Detail' is not of the expected class Koupgon.DetailTableViewController.")
      }
      return vc
    }

    case SigninScene = "Signin"
    static func instantiateSignin() -> Koupgon.SigninViewController {
      guard let vc = StoryboardScene.Main.SigninScene.viewController() as? Koupgon.SigninViewController
      else {
        fatalError("ViewController 'Signin' is not of the expected class Koupgon.SigninViewController.")
      }
      return vc
    }

    case SignupScene = "Signup"
    static func instantiateSignup() -> Koupgon.SignupViewController {
      guard let vc = StoryboardScene.Main.SignupScene.viewController() as? Koupgon.SignupViewController
      else {
        fatalError("ViewController 'Signup' is not of the expected class Koupgon.SignupViewController.")
      }
      return vc
    }

    case StoreScene = "Store"
    static func instantiateStore() -> Koupgon.StoreTableViewController {
      guard let vc = StoryboardScene.Main.StoreScene.viewController() as? Koupgon.StoreTableViewController
      else {
        fatalError("ViewController 'Store' is not of the expected class Koupgon.StoreTableViewController.")
      }
      return vc
    }

    case WebScene = "Web"
    static func instantiateWeb() -> Koupgon.WebViewController {
      guard let vc = StoryboardScene.Main.WebScene.viewController() as? Koupgon.WebViewController
      else {
        fatalError("ViewController 'Web' is not of the expected class Koupgon.WebViewController.")
      }
      return vc
    }

    case WelcomeScene = "Welcome"
    static func instantiateWelcome() -> Koupgon.WelcomeViewController {
      guard let vc = StoryboardScene.Main.WelcomeScene.viewController() as? Koupgon.WelcomeViewController
      else {
        fatalError("ViewController 'Welcome' is not of the expected class Koupgon.WelcomeViewController.")
      }
      return vc
    }
  }
}

struct StoryboardSegue {
}
