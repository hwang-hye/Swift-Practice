//
//  CurrentWeatherViewController.swift
//  Weather
//
//  Created by hwanghye on 6/19/24.
//

import UIKit
import CoreLocation
import MapKit
import Alamofire
import SnapKit

// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity, grndLevel: Int?
    let seaLevel: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}

class CurrentWeatherViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    let mapView = MKMapView()
    
    var currentLatitude: Double?
    var currentLongitude: Double?
    var weatherData = WeatherResponse(
        coord: Coord(lon: 0.0, lat: 0.0),
        weather: [],
        base: "",
        main: Main(temp: 0.0, feelsLike: 0.0, tempMin: 0.0, tempMax: 0.0, pressure: 0, humidity: 0, grndLevel: 0, seaLevel: nil),
        visibility: 0,
        wind: Wind(speed: 0.0, deg: 0, gust: 0.0),
        dt: 0,
        sys: Sys(type: 0, id: 0, country: "", sunrise: 0, sunset: 0),
        timezone: 0,
        id: 0,
        name: "",
        cod: 0
    )
    
    let backgroundImageView = UIImageView()
    let dateLabel = MyPaddingLabel()
    let GeolocateNavigationView = UIView()
    let locationSignImage = UIImageView()
    let locationLabel = UILabel()
    let shareButton = UIButton()
    let refreshButton = UIButton()
    let temperatureLabel = MyPaddingLabel()
    let humidityLabel = MyPaddingLabel()
    let windSpeedLabel = MyPaddingLabel()
    let weatherImage = UIImageView()
    let weatherScript = MyPaddingLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureLayout()
        
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        checkDeviceLocationAuthorization()
        
//        refreshButton.addTarget(self, action: #selector(refreshButtonClicked), for: .touchUpInside)
    }
    
    @objc func refreshButtonClicked() {
        checkDeviceLocationAuthorization()
        // 권한 요청 문구 띄우기
        // 항상 띄우지는 않는다. '처음'의 기준은? 띄울 수 있는 조건!
        // iPhone 위치 서비스
        // notDetermined
        
        // 2) 현재 사용자 위치 권한 상태 확인
        // 3)notDetermined일때 권한 요청
    }
    
    
    func loadItems()  {
        print(#function)
        guard let lat = currentLatitude, let lon = currentLongitude else {
                print("Current location not available")
                return
            }

        let url = "\(APIURL.weatherURL)lat=\(lat)&lon=\(lon)&appid=\(APIKey.id)&units=metric"

        AF.request(url, method: .get).responseDecodable(of: WeatherResponse.self) { response in
            switch response.result {
            case .success(let result):
                print(result)
                // UI Update
                self.weatherData = result
                let temperature = self.weatherData.main.temp
                let humidity = self.weatherData.main.humidity
                let windSpeed = self.weatherData.wind.speed
                self.temperatureLabel.text = "지금은 \(temperature)°C 에요"
                self.humidityLabel.text = "\(humidity!)% 만큼 습해요"
                self.windSpeedLabel.text = "\(windSpeed)의 바람이 불어요"
                
            case .failure(let error):
                print("Failed to load items: \(error)")
            }
        }
    }
    
    func configureUI() {
        backgroundImageView.image = UIImage(named: "grain-green")
        backgroundImageView.contentMode = .scaleAspectFill
        
        dateLabel.text = "date"
        dateLabel.font = .systemFont(ofSize: 14, weight: .regular)
        dateLabel.textColor = .white
        
        locationSignImage.image = UIImage(systemName: "location.fill")
        locationSignImage.contentMode = .scaleAspectFill
        locationSignImage.tintColor = .white
        
        locationLabel.text = "location label"
        locationLabel.font = .systemFont(ofSize: 26, weight: .regular)
        locationLabel.textColor = .white
        
        shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        shareButton.contentMode = .scaleToFill
        shareButton.tintColor = .white
        
        refreshButton.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        refreshButton.tintColor = .white
        
        temperatureLabel.text = "temperature label"
        temperatureLabel.font = .systemFont(ofSize: 20, weight: .medium)
        temperatureLabel.textAlignment = .center
        temperatureLabel.padding = UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 6)
        temperatureLabel.cornerRadius = 10
        temperatureLabel.backgroundColor = .white
        
        humidityLabel.text = "humidity label"
        humidityLabel.font = .systemFont(ofSize: 20, weight: .medium)
        humidityLabel.textAlignment = .center
        humidityLabel.padding = UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 6)
        humidityLabel.cornerRadius = 10
        humidityLabel.backgroundColor = .white
        
        windSpeedLabel.text = "windSpeed label"
        windSpeedLabel.font = .systemFont(ofSize: 20, weight: .medium)
        windSpeedLabel.textAlignment = .center
        windSpeedLabel.padding = UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 6)
        windSpeedLabel.cornerRadius = 10
        windSpeedLabel.backgroundColor = .white
    }
    
    func configureLayout() {
        view.addSubview(backgroundImageView)
        view.addSubview(dateLabel)
        backgroundImageView.addSubview(GeolocateNavigationView)
        GeolocateNavigationView.addSubview(locationSignImage)
        GeolocateNavigationView.addSubview(locationLabel)
        GeolocateNavigationView.addSubview(shareButton)
        GeolocateNavigationView.addSubview(refreshButton)
        backgroundImageView.addSubview(temperatureLabel)
        backgroundImageView.addSubview(humidityLabel)
        backgroundImageView.addSubview(windSpeedLabel)
        backgroundImageView.addSubview(weatherImage)
        backgroundImageView.addSubview(weatherScript)
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(30)
        }
        GeolocateNavigationView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(backgroundImageView.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(50)
        }
        locationSignImage.snp.makeConstraints { make in
            make.leading.equalTo(GeolocateNavigationView.safeAreaLayoutGuide)
            make.verticalEdges.equalTo(GeolocateNavigationView.safeAreaLayoutGuide).inset(5)
            make.height.width.equalTo(40)
        }
        locationLabel.snp.makeConstraints { make in
            make.verticalEdges.equalTo(GeolocateNavigationView.safeAreaLayoutGuide).inset(5)
            make.leading.equalTo(locationSignImage.snp.trailing).offset(10)
            make.width.equalTo(160)
        }
        refreshButton.snp.makeConstraints { make in
            make.trailing.equalTo(GeolocateNavigationView.safeAreaLayoutGuide)
            make.verticalEdges.equalTo(GeolocateNavigationView.safeAreaLayoutGuide).inset(5)
            make.height.width.equalTo(40)
        }
        shareButton.snp.makeConstraints { make in
            make.verticalEdges.equalTo(GeolocateNavigationView.safeAreaLayoutGuide).inset(5)
            make.trailing.equalTo(refreshButton.snp.leading)
            make.height.width.equalTo(40)
        }
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(GeolocateNavigationView.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.height.equalTo(50)
        }
        humidityLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.height.equalTo(50)
        }
        windSpeedLabel.snp.makeConstraints { make in
            make.top.equalTo(humidityLabel.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.height.equalTo(50)
        }
    }
}

extension CurrentWeatherViewController {
    // 1) if: 사용자에게 권한 요청을 하기 위해, iOS 위치 서비스 활성화 여부 체크
    // 2) else: 현재 사용자 위치 권한 상태 확인
    func checkDeviceLocationAuthorization() {
        if CLLocationManager.locationServicesEnabled() {
            checkCurrentLocationAuthoriztion()
        } else {
            print("위치 서비스가 꺼져 있어서, 권한 요청을 할 수 없어요")
        }
    }
    
    // 현재 사용자 위치 권한 상태 확인
    func checkCurrentLocationAuthoriztion() {
        var status: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            status = locationManager.authorizationStatus
        } else {
            status = CLLocationManager.authorizationStatus()
        }
        
        switch status {
        case .notDetermined:
            print("이 권한에서만 문구를 띄울 수 있음")
            // 사용자 위치 주기적으로 업데이트
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            // info에서 요청 권힌 설정 체크
            locationManager.requestWhenInUseAuthorization()
            
        case .denied:
            print("iOS 설정 창으로 이동하라는 얼럿을 띄워주기")
        case .authorizedWhenInUse:
            print("위치 정보 알려달라고 로직을 구성할 수 있음")
            // 위치 버전에 대한 보장이 필요하다
            // 나중에 추가되는 케이스에 대한 관리 @unknown default
            locationManager.startUpdatingLocation()
            // startUpdatingLocation: didUpdateLocations가 실행됨
        default:
            print(status)
        }
    }
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
        
    }
}

extension CurrentWeatherViewController: CLLocationManagerDelegate {
    
    // didUpdateLocations
    // 사용자 위치를 성공적으로 가지고 온 경우
    // 코드 구성에 따라 여러번 호출이 될 수도 있다
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {
            print(coordinate.latitude)
            print(coordinate.longitude)
        
            // 전역 프로퍼티에 위치 데이터 저장
            self.currentLatitude = coordinate.latitude
            self.currentLongitude = coordinate.longitude
            loadItems()
            setRegionAndAnnotation(center: coordinate)
            
        }
    }
    // didFailWithError
    // 사용자 위치를 가지고 오지 못한 경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(#function)
        print("위치 가지고 오지 못함")
    }
    // locationManagerDidChangeAuthorization
    // 사용자 권한 상태가 변경이 될 때(iOS14) + 인스턴스가 생성이 될 때에도 호출이 된다
    // 사용자가 허용 했었는데 아이폰 설정에서 나중에 허용을 거부한다면
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkDeviceLocationAuthorization()
    }
}
    
    
// Text Label Padding Subclass
class MyPaddingLabel: UILabel {
    var padding: UIEdgeInsets = .zero {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    override var text: String? {
        didSet {
            setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .clear
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.width += padding.left + padding.right
        size.height += padding.top + padding.bottom
        return size
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var rect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        rect.origin.x -= padding.left
        rect.origin.y -= padding.top
        rect.size.width += padding.left + padding.right
        rect.size.height += padding.top + padding.bottom
        return rect
    }
}

