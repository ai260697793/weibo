//
//  MHOAuthViewController.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/6.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit
import SVProgressHUD

class MHOAuthViewController: UIViewController, UIWebViewDelegate {
    
    let webView = UIWebView()
    
    override func loadView() {
        view = webView
        webView.delegate = self
        setupNav()
    }

    ///  App Key：2990485310
    ///  App Secret：c0e78554e15a9f441a9f59dac7d6a772
    ///  https://api.weibo.com/oauth2/authorize?client_id=2990485310&redirect_uri=http://www.baidu.com

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = NSURLRequest(URL: NSURL(string: "https://api.weibo.com/oauth2/authorize?client_id=2990485310&redirect_uri=http://www.baidu.com")!)
        
        webView.loadRequest(request)
        
        // Do any additional setup after loading the view.
        
    }
    
    
    
    // MARK: - 设置NAV
    private func setupNav(){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(MHOAuthViewController.dismiss))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(MHOAuthViewController.autoFill))
    }
    
    // MARK: - 按钮点击方法
    @objc private func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @objc private func autoFill() {
        let jsString = "document.getElementById('userId').value='18373280031';document.getElementById('passwd').value='woAIya'"

        webView.stringByEvaluatingJavaScriptFromString(jsString)
    }
}


extension MHOAuthViewController {
    // MARK: - webView代理方法
    func webViewDidStartLoad(webView: UIWebView) {
        SVProgressHUD.show()
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        SVProgressHUD.showErrorWithStatus(error?.description)
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
//        print(request)
/*
         <NSMutableURLRequest: 0x7fd63b9cfca0> { URL: https://api.weibo.com/oauth2/authorize?client_id=2990485310&redirect_uri=http://www.baidu.com# }
         <NSMutableURLRequest: 0x7fd63ba1ae20> { URL: https://api.weibo.com/oauth2/authorize }
         <NSMutableURLRequest: 0x7fd639541e80> { URL: http://www.baidu.com/?code=1c2f67b2f70fb30755aca6963c1763f7 }
         <NSMutableURLRequest: 0x7fd63ba00290> { URL: https://m.baidu.com/?code=1c2f67b2f70fb30755aca6963c1763f7&from=844b&vit=fps }
*/
        if let absoluteString = request.URL?.absoluteString {
            if absoluteString.hasPrefix(AppRedictUrl) {
//                print(absoluteString)
                
                if let query = request.URL?.query {
                    // 截取到 code=d51f8c7887d8abe18a202a3e5c8f38fc
//                    print(query)
                    let code = query.substringFromIndex("code=".endIndex)
//                    print(code)
                    
                    // 调用afn请求,用code来换取token
                    // 调用成功,切换视图控制器,失败,显示失败信息
                    MHOauthViewModel.sharedInstance.loadToken(code, success: {
                        self.dismiss()
                        SVProgressHUD.dismiss()
                        }, failed: { 
                            //处理失败信息
                    })
                }
            }
        }
        
        return true
    }
}
