const City = process.argv[2];
const API_KEY = "b5a38a8f6c9fbd3d702a1296e68a3494"
const fs = require("fs")
fetch(`https://api.openweathermap.org/data/2.5/weather?q=${City}&appid=${API_KEY}`).then(response => {
    response.json().then(resp => {
        try {
            fs.rmSync(`weather.${City}.txt`)
        } catch {

        }
        fs.writeFileSync(`weather.${City}.txt`, `
        Wetter: ${resp.weather[0].main} - ${resp.weather[0].description}
        Temperatur: ${Math.round(resp.main.temp - 273)} °C
        Gefühlt: ${Math.round(resp.main.feels_like - 273)} °C
        Luftfeuchtigkeit: ${Math.round(resp.main.humidity)}%
        
        
        `)
    })
})