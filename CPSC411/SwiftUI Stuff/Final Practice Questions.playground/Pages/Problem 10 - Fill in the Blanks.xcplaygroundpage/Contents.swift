//=======================================================================//
//  Problem 10: Fill in the lines of code to let the below code compile  //
//=======================================================================//

public class Movie: CustomStringConvertible {
    private(set) var title: String
    private(set) var director: String
    
    public var description: String {
        return "The movie \"\(title)\" was directed by: \(director)"
    }
    
    init(title: String, director: String) {
        self.title = title
        self.director = director
    }
}

var things = [Any]()

//--------------//
//  Given Code  //
//--------------//
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(title: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

print(things)
