//
//  NasaViewController.swift
//  Movie
//
//  Created by hwanghye on 7/1/24.
//

import UIKit
import SnapKit

private enum Nasa: String, CaseIterable {
    
    static let baseURL = "https://apod.nasa.gov/apod/image/"
    
    case one = "2308/sombrero_spitzer_3000.jpg"
    case two = "2212/NGC1365-CDK24-CDK17.jpg"
    case three = "2307/M64Hubble.jpg"
    case four = "2306/BeyondEarth_Unknown_3000.jpg"
    case five = "2307/NGC6559_Block_1311.jpg"
    case six = "2304/OlympusMons_MarsExpress_6000.jpg"
    case seven = "2305/pia23122c-16.jpg"
    case eight = "2308/SunMonster_Wenz_960.jpg"
    case nine = "2307/AldrinVisor_Apollo11_4096.jpg"
    case invalid = "invalid_url" // error 확인 위한 잘못된 URL 항목
     
    static var photo: URL {
        return URL(string: Nasa.baseURL + Nasa.allCases.randomElement()!.rawValue)!
    }
}

class NasaViewController: BaseViewController {
    let nasaImageView = UIImageView()
    let progressLabel = UILabel()
    let requestButton = UIButton()
    
    var total: Double = 0
    var buffer: Data? {
        didSet {
            let result = Double(buffer?.count ?? 0) / total
            progressLabel.text = "\(result * 100) / 100"
        }
    }
    var session: URLSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestButton.addTarget(self, action: #selector(requestButtonClicked), for: .touchUpInside)
    }
    
    func callRequest() {
        print("call:", #function)
        // error 검증 위한 잘못된 request
        // let request = URLRequest(url: URL(string: Nasa.baseURL + Nasa.invalid.rawValue)!)
        let request = URLRequest(url: Nasa.photo)
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        session.dataTask(with: request).resume()
    }
    
    @objc func requestButtonClicked() {
        print(#function)
        buffer = Data()
        requestButton.isEnabled = false
        callRequest()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        session.invalidateAndCancel()
    }
    
    override func configureHierarchy() {
        view.addSubview(nasaImageView)
        view.addSubview(progressLabel)
        view.addSubview(requestButton)
    }
    override func configureLayout() {
        nasaImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(nasaImageView.snp.width).multipliedBy(4.0/3.0)
        }
        progressLabel.snp.makeConstraints { make in
            make.bottom.equalTo(requestButton.snp.top).inset(-20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(44)
        }
        requestButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(44)
        }
    }
    override func configureView() {
        nasaImageView.backgroundColor = .white
        progressLabel.backgroundColor = .lightGray
        requestButton.backgroundColor = .gray
        
        nasaImageView.contentMode = .scaleAspectFill
        progressLabel.text = "Downloading..."
        progressLabel.textAlignment = .center
        requestButton.setTitle("사진 요청", for: .normal)
        requestButton.setTitleColor(.lightGray, for: .highlighted)
    }
}

extension NasaViewController: URLSessionDataDelegate {
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        print("response:", #function)
        if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
            let contentLength = response.value(forHTTPHeaderField: "Content-Length")!
            total = Double(contentLength)!
            return .allow
        } else {
            return .cancel
        }
    }
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print("data:", #function)
        buffer?.append(data)
    }
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: (any Error)?) {
        print("error", #function)
        requestButton.isEnabled = true
        if let error = error {
            progressLabel.text = "문제가 발생했습니다"
            nasaImageView.image = UIImage(systemName: "star")
            nasaImageView.contentMode = .scaleAspectFit
        } else {
            print("성공")
            guard let buffer = buffer else {
                print("Buffer nil")
                return
            }
            let image = UIImage(data: buffer)
            nasaImageView.image = image
        }
    }
}

