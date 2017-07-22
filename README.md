# codableScratch
## Using the Codable Protocol to read/write JSON in Swift
This project is essentially a bookmark for me on how to use the `Codable`
protocol in **Swift**

I have scowered the web looking for information on getting **Swift** to work 
with **JSON**.  Yes, there are great 3rd party libraries out there, but learning
that the **XCode 9** beta supplied this ability with the `Codable` protocol...I 
had to try it out.

My goal was to 
1. create an object in **Swift**
2. serialize it to JSON.
3. create an object in **Swift** from a JSON string.

All of the string results are displayed in a TextView.  

I also wanted to see how arrays might work in this regard.  So the `struct`
objects I created also have arrays.

Here's the JSON reading/writing, and **Swift** object creating:
```swift
    let servingTypes = [ServingType(name: "can", grams: 100), ServingType(name: "bottle", grams: 300)]
    
    let food = Food(name: "Coke", calories: 150, carbs: 30.0, servingTypes: servingTypes)
    
    txtTestLog.string.append("food - \(food)")
    
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let data = try! encoder.encode(food)
    txtTestLog.string.append("\n")
    txtTestLog.string.append(String(data: data, encoding: .utf8)!)
    
    let decoder = JSONDecoder()
    let decodedFood = try! decoder.decode(Food.self, from: data)
    txtTestLog.string.append("\n")
    txtTestLog.string.append("decoded food \(decodedFood)")
```

Here's the objects:
```swift
struct ServingType: Codable {
  let name: String
  let grams: Float
}

struct Food: Codable {
  let name: String
  let calories: Int
  let carbs: Float
  let servingTypes: [ServingType]
}
```

As you'll see in this little project, there's really not much more to it.

Hope this helps!

-Christian

#### Caveats
* I'm not saying this is the ideal way to write this code...but it works.  
* It does not cover all the ways JSON might appear
* I apologize for the lack of unit tests.  Generally speaking, I like 100% 
    coverage on all of my code.  My scratch projects...hardly seems worth it.

#### Websites that helped me
[Friday Q&A 2017-07-14: Swift.Codable](https://www.mikeash.com/pyblog/friday-qa-2017-07-14-swiftcodable.html)

[Is Swift 4 Codable good for JSON?](https://medium.com/@rjchatfield/swift-4-decodable-2ca8645ce4)