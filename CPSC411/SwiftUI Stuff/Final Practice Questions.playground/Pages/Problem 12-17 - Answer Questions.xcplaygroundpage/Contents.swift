//=============================================================================//
//  Problem 12: Can you add a stored property by using an extension? Explain.  //
//=============================================================================//

//------------//
//  Solution  //
//------------//
// No, it's not possible. An extension can be used to add new behavior to an existing type, but not to alter the type itself or its interface.

//=====================================================================================//
//  Problem 13: How do you prevent circular references, which can cause memory leaks?  //
//=====================================================================================//

//------------//
//  Solution  //
//------------//
//  Use a weak reference for one of the references, then use strong references for the rest.

//==============================================================================//
//  Problem 14: Is Swift an Object-Oriented Language or a Functional Language?  //
//==============================================================================//

//------------//
//  Solution  //
//------------//
//  Swift is an Object-Oriented (OOP) Language. It supports encapsulataion, inheritance, and polymorphism.
//  Like C++ and Python, Swift has a mixed programming paradigm, allowing either OOP, or programming with functions, or both.

//================================================================//
//  Problem 15: What are the various ways to unwrap an Optional?  //
//  How do they rate in safety?                                   //
//================================================================//

//------------//
//  Solution  //
//------------//
//  Force unwrapping (/) operator               = unsafe
//  implicitly unwrapped variable declaration   = unsafe in most cases
//  Optional binding                            = safe
//  Optional chaining                           = safe
//  nil coalescing operation                    = safe
//  Guard statements                            = safe
//  Optional patterns                           = safe

//==========================================================================//
//  Problem 16: When should you use a struct? When should you use a class?  //
//==========================================================================//

//------------//
//  Solution  //
//------------//
//  Classes support inheritance, Structs do not.
//  Classes are reference types, Structs are value types.
//  In general, use structures unless you need inheritance or reference semantics, because Structs have higher performance.

//=================================================================//
//  Problem 17: Will the code below compile? Why or why not?       //
//  If not, change the code in class star so that it will compile  //
//-----------------------------------------------------------------//
//  class Star {                                                   //
//        class func spin() {}                                     //
//      class final func illuminate() {}                           //
//  }                                                              //
//                                                                 //
//  class Sun : Star {                                             //
//        override class func spin() { super.spin(); }             //
//      override static func illuminate() { super.illuminate(); }  //
//  }                                                              //
//=================================================================//

//------------//
//  Solution  //
//------------//
//  No, the code will not compile because you cannot override a final method in a subclass.
//  In order for the code to compile, you need to remove the final keyword from the method.
