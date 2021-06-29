
import Foundation
protocol WeatherDelegate
{
    func didUpdateWeather(_ weatherManager:WeatherManager,weather:Weathermodel)
    func didFailWithError(error:Error)
}

struct WeatherManager {
    var delegate:WeatherDelegate?
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=1a260737629dbab9e90ccb187fd5343f&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
        
    }
    
    func performRequest(urlString:String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, respone, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data{
                    if let weather = parseJSON(weatherdata: safeData){
                        self.delegate?.didUpdateWeather(self, weather:weather)
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(weatherdata:Data)->Weathermodel?{
        let decoder = JSONDecoder()
        do{
            let decoded = try decoder.decode(WeatherData.self, from: weatherdata)
            let id = decoded.weather[0].id
            let temp = decoded.main.temp
            let name = decoded.name
            
            let weather = Weathermodel(conditionId: id, cityName: name, temperature: temp)
            return weather
            print(weather.temperatureString)
        }catch{
            self.delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
    
    
}
