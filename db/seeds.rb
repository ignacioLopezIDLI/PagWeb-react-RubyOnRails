# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
 lenguajes = Lenguaje.create([
  { 
    name: "Python",
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/768px-Python-logo-notext.svg.png"
  },
  {
    name: "JavaScript", 
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/800px-Unofficial_JavaScript_logo_2.svg.png"
  },
  {
    name: "Ruby",
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/800px-Ruby_logo.svg.png"  
  },
  {
    name: "C++",
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/ISO_C%2B%2B_Logo.svg/800px-ISO_C%2B%2B_Logo.svg.png"
  },
  {
    name: "Java", 
    image_url: "https://upload.wikimedia.org/wikipedia/es/thumb/3/30/Java_programming_language_logo.svg/800px-Java_programming_language_logo.svg.png"
  },
  {
    name: "Go",
    image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Go_Logo_Blue.svg/800px-Go_Logo_Blue.svg.png"
  }  
])

reviews = Review.create([
    {
        title: "Buen lenguaje versatil",
        description:"Excelentes herramientas",
        score: 5,
        lenguaje: lenguajes.first
    },
    {
        title: "Mal lenguaje",
        description:"Sin herramientas",
        score: 1,
        lenguaje: lenguajes.first
    }
])
