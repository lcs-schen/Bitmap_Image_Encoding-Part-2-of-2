//: [Previous](@previous) / [Next](@next)
//: # Decoding an Image
//: The following two statements are required to make the playground run. Please do not remove.
import Cocoa
import PlaygroundSupport
/*:
 ## Decoding the text
 Now we will (at last!) decode the image.
 
 Recall, our rules are:
 
 * If a line starts with a 0, the first pixel is black.
 * If a line does not start with a 0, the first pixel is white.
 * When a comma is encountered, a new number begins, and the colour switches.
 * When a newline character is encountered, go to a new row in the image.
 * Once we have a new number, we draw that many pixels in the current colour.
 
 First, copy and paste your encoded image string to this page.
*/

// Copy your encoded image string here...
let encodedBitmap = """
a7b1a49
a5b2c1b1a29
a4b1c1b1c1b1a29
a3b1c3d1b1a29
a3b1c2d1b3a28
a1b3d3b1e2b2a26
b1e1b2d2b1e5b1a7
b2e2b2e1b1e2b3a7
b2e4b1c1e2b2a3b5
a1b1e3b2c1e2b1a3b1c5
a1b3c2e4b1a1b1c6
a2b1c4e2b1e1b1a1b1c3d1b2
a1b1d1b6d1b1e1b1d1c2d2b2
a2b1d6c1b1e2b1d4b2
a2b1c3d2b1c1b1e1b3d2b1a2
a3b1d1c1d1c1b2e4b3a3
a3b2c1b1c1b1e3b3a5
a3b1e1b1e1b3e3b2a5
a3b1e1b1e2b1e4b1a6
a4b4a1b4a7
"""

// Make a canvas
let canvas = Canvas(width: 402, height: 402)

// Make a grid
// NOTE: The code that builds the grid was tucked away in something called a *function* to keep things tidy. We'll learn about functions later.
drawGrid(on: canvas)

// Start drawing at left
var x = 0

// Set the size of a "pixel"
let cellSize = 20

// Keep track of current colour
var currentColor = "white"

// Start drawing at top of grid
var y = canvas.height - cellSize - 2

// Store the current number of pixels to draw
var drawThisManyPixels = 0

// Iterate over each character in the encoded bitmap string
for character in encodedBitmap {
    
    // Set colour at start of a line
    if character == "a" {
        
        canvas.fillColor = Color.blue
        currentColor = "blue"

    } else if character == "b" {
        canvas.fillColor = Color.black
        currentColor = "black"
   
    } else if character == "c" {
        canvas.fillColor = Color.white
        currentColor = "white"
   
    } else if character == "d" {
        canvas.fillColor = Color.yellow
        currentColor = "yellow"
        
    } else if character == "e" {
        canvas.fillColor = Color.red
        currentColor = "red"
    
    } else if character == "e" {
        canvas.fillColor = Color.red
        currentColor = "red"
    
    
        
        // We have a new number
        // Are we past the first pixel in a row?
        if x > 0 {

            // Toggle the pixel colour
            if currentColor == "black" {
                currentColor = "white"
                canvas.fillColor = Color.white
            } else {
                currentColor = "black"
                canvas.fillColor = Color.black
            }

        }
        
    } else if character == "\n" {
        
        // We are on a new line, so reduce the vertical position
        // and reset the horizontal position
        y = y - cellSize
        x = 0
        
        // Default colour after new line is white
        canvas.fillColor = Color.white
        currentColor = "white"
        
    } else {
        
        // Get the new number of pixels to draw
        drawThisManyPixels = Int(String(character))!
        
        // Draw the pixels
        for _ in 1...drawThisManyPixels {

            // Draw the enlarged "pixel"
            canvas.drawRectangle(bottomLeftX: x, bottomLeftY: y, width: cellSize, height: cellSize)
            
            // Increase x so that the next pixel is drawn to the right of this one
            x += cellSize

        }

    }
    
}

/*:
 ### Check the results
 Does the output match what you'd expect, based on the values in the encoded string?
 
 How do you know?
 
 Write your ideas in the code comment below.
 */

// I notice that...
// I know this because...

/*:
 ## Extension
 Now that you have an understanding of how if statements (also called *selection* statements or *conditional* statements) work... extend this code.
 
 How could you adjust the rules so that pixels can be rendered in colour?
 
 What additions or changes would you need to make to the code above?
 
 Work with a partner to discuss possibilities and then make the changes in code.
 */


/*:
 Now, **remember to commit and push your work**.
 */
/*:
 ## Template code
 The code below is necessary to see results in the Assistant Editor at right. Please do not remove.
 */
PlaygroundPage.current.liveView = canvas.imageView
