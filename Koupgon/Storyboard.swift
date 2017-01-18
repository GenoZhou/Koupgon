// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit

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

// swiftlint:disable file_length
// swiftlint:disable type_body_length

struct StoryboardScene {
  enum LaunchScreen: StoryboardSceneType {
    static let storyboardName = "LaunchScreen"
  }
  enum Main: String, StoryboardSceneType {
    static let storyboardName = "Main"

    case BrowseScene = "Browse"
    static func instantiateBrowse() -> BrowseTableViewController {
      guard let vc = StoryboardScene.Main.BrowseScene.viewController() as? BrowseTableViewController
      else {
        fatalError("ViewController 'Browse' is not of the expected class BrowseTableViewController.")
      }
      return vc
    }

    case SigninScene = "Signin"
    static func instantiateSignin() -> SigninViewController {
      guard let vc = StoryboardScene.Main.SigninScene.viewController() as? SigninViewController
      else {
        fatalError("ViewController 'Signin' is not of the expected class SigninViewController.")
      }
      return vc
    }

    case SignupScene = "Signup"
    static func instantiateSignup() -> SignupViewController {
      guard let vc = StoryboardScene.Main.SignupScene.viewController() as? SignupViewController
      else {
        fatalError("ViewController 'Signup' is not of the expected class SignupViewController.")
      }
      return vc
    }

    case WelcomeScene = "Welcome"
    static func instantiateWelcome() -> WelcomeViewController {
      guard let vc = StoryboardScene.Main.WelcomeScene.viewController() as? WelcomeViewController
      else {
        fatalError("ViewController 'Welcome' is not of the expected class WelcomeViewController.")
      }
      return vc
    }
  }
}

struct StoryboardSegue {
}
