import UIKit

class Filter {
    
    func pure(image: UIImage) -> UIImage {
        let rgbaImage = RGBAImage(image: image)!
        return rgbaImage.toUIImage()!
    }
    
    func red(image: UIImage) -> UIImage {
        let rgbaImage = RGBAImage(image: image)!
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                let maxRed = 255
                let redStep = (maxRed - Int(pixel.red)) / 10
                
                pixel.red += UInt8(redStep * 5)
                rgbaImage.pixels[index] = pixel
            }
        }; return rgbaImage.toUIImage()!
    }
    
    func green(image: UIImage) -> UIImage {
        let rgbaImage = RGBAImage(image: image)!
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                let maxGreen = 255
                let greenStep = (maxGreen - Int(pixel.green)) / 10
                
                pixel.green += UInt8(greenStep * 5)
                rgbaImage.pixels[index] = pixel
            }
        }; return rgbaImage.toUIImage()!
    }
    
    func blue(image: UIImage) -> UIImage {
        let rgbaImage = RGBAImage(image: image)!
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                let maxBlue = 255
                let blueStep = (maxBlue - Int(pixel.blue)) / 10
                
                pixel.blue += UInt8(blueStep * 5)
                rgbaImage.pixels[index] = pixel
            }
        }; return rgbaImage.toUIImage()!
    }
    
    func greyness(image: UIImage, effect: Int = 3) -> UIImage {
        let rgbaImage = RGBAImage(image: image)!
        
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                var avgColor: Int = (Int(pixel.red) +
                    Int(pixel.green) + Int(pixel.blue)) / effect
                if avgColor > 255 {
                    avgColor = 255
                }
                
                pixel.red = UInt8(avgColor)
                pixel.green = UInt8(avgColor)
                pixel.blue = UInt8(avgColor)
                
                rgbaImage.pixels[index] = pixel
            }
        }; return rgbaImage.toUIImage()!

    }
    

    func sepia(image: UIImage) -> UIImage  {
        let rgbaImage = RGBAImage(image: image)!
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                
                let boxRed = Double(pixel.red) * 0.393 + Double(pixel.green) * 0.769 + Double(pixel.blue) * 0.189
                let boxGreen = Double(pixel.red) * 0.349 + Double(pixel.green) * 0.686 + Double(pixel.blue) * 0.168
                let boxBlue = Double(pixel.red) * 0.272 + Double(pixel.green) * 0.534 + Double(pixel.blue) * 0.131
                pixel.red = UInt8(max(min(255, boxRed), 0))
                pixel.green = UInt8(max(min(255, boxGreen), 0))
                pixel.blue = UInt8(max(min(255, boxBlue), 0))
                
                rgbaImage.pixels[index] = pixel
            }
        }; return rgbaImage.toUIImage()!
    }
}

let filter = Filter()



