//
//  WelcomeViewController.swift
//  Spotify-Clone
//
//  Created by Ferid Suleymanzade on 08.11.24.
//

import UIKit  // UIKit çerçevesi, iOS kullanıcı arayüzü oluşturmak için gerekli sınıfları içerir

// WelcomeViewController: UIViewController sınıfını miras alır ve uygulamanın giriş ekranını tanımlar
class WelcomeViewController: UIViewController {
    
    // Özel bir UIButton oluşturuyoruz, kullanıcının Spotify ile giriş yapması için
    private let SignInButton: UIButton = {
        let button = UIButton()  // Yeni bir UIButton nesnesi oluştur
        button.backgroundColor = .white  // Arka plan rengini beyaz yap
        button.setTitle("Sign In With Spotify", for: .normal)  // Butonun başlığını ayarla
        button.setTitleColor(.blue, for: .normal)  // Yazı rengini mavi yap
        
        return button  // Butonu döndür
    }()

    // viewDidLoad() görünüm yüklendiğinde çağrılır
    override func viewDidLoad() {
        super.viewDidLoad()  // Süper sınıfın viewDidLoad metodunu çağır

        title = "Spotify"  // Ekran başlığını "Spotify" olarak ayarla
        view.backgroundColor = .systemGreen  // Arka plan rengini yeşil yap
        view.addSubview(SignInButton)  // Butonu ekrana ekle
        SignInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        // Butona tıklanıldığında didTapSignIn metodunu çağır
    }
    
    // viewDidLayoutSubviews() görünüm düzenlenirken çağrılır, burada butonun boyutunu ayarlarız
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()  // Süper sınıfın viewDidLayoutSubviews metodunu çağır
        SignInButton.frame = CGRect(
            x: 20,  // Butonun sol kenarından olan uzaklık
            y: view.height - 50 - view.safeAreaInsets.bottom,  // Ekranın altına yakın bir konumda olacak şekilde ayarla
            width: view.width - 40,  // Buton genişliğini ekran genişliğine göre ayarla
            height: 50  // Buton yüksekliğini 50 piksel olarak ayarla
        )
    }
    
    // didTapSignIn(): Kullanıcı giriş butonuna bastığında çağrılır
    @objc func didTapSignIn() {
        let vc = AuthViewController()  // Yeni bir AuthViewController nesnesi oluştur
        vc.completionHandler = { [weak self] success in  // Giriş işleminden sonra yapılacak işlemleri belirler
            DispatchQueue.main.async {  // Ana iş parçacığında işlem yapar
                self?.handleSignIn(success: success)  // Giriş başarılı veya başarısız sonuçlarını işler
            }
        }
        vc.navigationItem.largeTitleDisplayMode = .never  // Ekranda büyük başlık gösterimini devre dışı bırak
        navigationController?.pushViewController(vc, animated: true)  // Giriş ekranını göster
    }
    
    // handleSignIn(success: Bool) metodu: Giriş işleminin sonucunu işler
    private func handleSignIn(success: Bool) {
        // Giriş başarılıysa kullanıcıyı giriş yapmış say, başarısızsa hata bildirimi yap
    }
}
