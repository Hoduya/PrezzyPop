//
//  ViewController.swift
//  PrezzyPop
//
//  Created by HoJun on 2022/09/13.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    
    // MARK: - ViewLoad
    override func loadView() {
        view = loginView
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.emailTextField.delegate = self
        loginView.passwordTextField.delegate = self
        
        setupButtonAction()
    }
    
    
    // MARK: - 뷰 버튼의 타겟 설정
    func setupButtonAction() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.passwordSecureButton.addTarget(self, action: #selector(passWordSecureModeSetting), for: .touchUpInside)
        
        
    }
    
    
    // MARK: - 버튼 액션 함수
    
    @objc func resetButtonTapped() {
        let alert = UIAlertController(title: "비밀번호 변경", message: "비밀번호를 변경하시겠습니까?", preferredStyle: .alert)
        
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인버튼 눌림")
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel) { cancel in
            print("취소버튼 눌림")
        }
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }

    @objc private func passWordSecureModeSetting() {
        loginView.passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc func loginButtonTapped() {
        print("로그인 버튼 눌림")
    }
    
    
    // MARK: - View touch action
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == loginView.emailTextField) {
            textField.resignFirstResponder()
            loginView.passwordTextField.becomeFirstResponder()
        } else if(textField == loginView.passwordTextField){
            textField.resignFirstResponder()
        }
        return true
    }
}

