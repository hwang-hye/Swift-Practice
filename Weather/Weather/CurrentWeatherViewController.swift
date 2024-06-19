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
    let pressure, humidity, seaLevel, grndLevel: Int?

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
    let gust: Double
}

class CurrentWeatherViewController: UIViewController {
    let locationManager = CLLocationManager()
    let mapView = MKMapView()
    
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
        loadItems()
    }

    
    func loadItems() {
        let url = "\(APIURL.weatherURL)\(APIKey.id)&lat=37.58877876214195&lon=127.00473275515431"
        
        AF.request(url, method: .get).responseDecodable(of: WeatherResponse.self) { response in
            switch response.result {
            case .success(let result):
                print(result)
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

