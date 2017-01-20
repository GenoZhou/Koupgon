//
//  WebViewController.swift
//  Koupgon
//
//  Created by GenoZhou on 2017-01-20.
//  Copyright © 2017 genozhou. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webview: UIWebView!
    
    var urlContext: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dPrint(urlContext)
        webview.delegate = self
        guard let url = URL(string: urlContext) else { return }
        let requestObj = URLRequest(url: url)
        webview.loadRequest(requestObj)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
