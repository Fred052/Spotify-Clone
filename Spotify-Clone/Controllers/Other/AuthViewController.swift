//
//  AuthViewController.swift
//  Spotify-Clone
//
//  Created by Ferid Suleymanzade on 08.11.24.
//

import UIKit
import WebKit



class AuthViewController: UIViewController, WKNavigationDelegate {
    
    // Web sayfasını göstermek için bir WKWebView tanımlarız
    private let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true  // JavaScript içeriğini çalıştırmaya izin ver
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs  // Konfigürasyona tercihleri ekle
        let webView = WKWebView(frame: .zero, configuration: config)  // Belirtilen konfigürasyonla webView oluştur
        
        return webView  // webView nesnesini döndür
    }()
    
    // Tamamlandığında dönecek sonucu belirleyen bir kapanış (closure) tanımlanır
    public var completionHandler: ((Bool) -> Void)?

    // viewDidLoad() görünüm yüklendiğinde çağrılır
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"  // Başlığı "Sign In" olarak ayarla
        view.backgroundColor = .systemBackground  // Arka plan rengini sistem arka plan rengi olarak ayarla
        webView.navigationDelegate = self  // webView'in navigationDelegate özelliğini bu sınıfa ayarla
        view.addSubview(webView)  // webView'i ana görünüme ekle
        guard let url = AuthManager.shared.signInURL else {
            return  // Eğer geçerli bir URL yoksa fonksiyondan çık
        }
        
        webView.load(URLRequest(url: url))  // webView'e kimlik doğrulama URL'sini yükle
    }
    
    // viewDidLayoutSubviews() görünüm düzenlenirken çağrılır, burada webView'i tam ekran yaparız
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds  // webView'i ekranın tamamına yerleştir
    }
    
    // webView yüklemeye başladığında çağrılır
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else {
            return  // Eğer geçerli bir URL yoksa fonksiyondan çık
        }
        
        // Giriş işlemi başarılı olduğunda erişim kodunu alırız
        guard let code = URLComponents(string: url.absoluteString)?.queryItems?.first(where: { $0.name == "code" })?.value else {
            return  // Eğer "code" parametresi bulunamazsa fonksiyondan çık
        }
        webView.isHidden = true
        
        print("Code: \(code)")  // Kod konsola yazdırılır
        AuthManager.shared.exchangeCodeForToken(code: code) { [weak self ] success in
            DispatchQueue.main.async {
                self?.navigationController?.popViewController(animated: true)
                self?.completionHandler?(success)
            }
        }
    }
}
