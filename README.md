# Pluto Prigramming Language

Pluto is like Ruby's fun cousin, but built entirely in C#! 🌟 It's an object-oriented interpreter with cool standard libraries, including a Plugin system—just don’t expect it to be a Ruby clone; it's got its own groove! 😎🚀

```ruby 
module Vectors
    class VectorBaseModel
        #BaseModel Ideas Here
    end
    class Vector3 < VectorBaseModel

        def initialize(x,y,z)
            @x_val = x.to_s.to_f
            @y_val = y.to_s.to_f
            @z_val = z.to_s.to_f
            
            @points = 3
        end

        def add(other)
            @x_val = (@x_val + other.x).to_s
            @y_val = (@y_val + other.y).to_s
            @z_val = (@z_val + other.z).to_s
        end

        def subt(other)
            @x_val = (@x_val - other.x).to_s
            @y_val = (@y_val - other.y).to_s
            @z_val = (@z_val - other.z).to_s
        end
    
        def mult(other)
            @x_val = (@x_val * other.x).to_s
            @y_val = (@y_val * other.y).to_s
            @z_val = (@z_val * other.z).to_s
        end

        def div(other)
            @x_val = (@x_val / other.x).to_s
            @y_val = (@y_val / other.y).to_s
            @z_val = (@z_val / other.z).to_s
        end
    end
end

vector3 = Vectors::Vector3.new(2,2,2).yield() do |vec3|

    print(vec3.x+vec3.y+vec3.z)

    vec3.add(Vectors::Vector3.new(2,3,4))

    vec3.subt(Vectors::Vector3.new(34,65,77))

    vec3.mult(Vectors::Vector3.new(2.4,2.3,2))

    vec3.div(Vectors::Vector3.new(2,2.1,1.98))

    #puts(vec3.to_s())

    puts("x: "+vec3.x.to_d.to_s ,
         "y: "+vec3.y.to_d.to_s ,
         "z: "+vec3.z.to_d.to_s )

    #puts(vec3.to_hs())

end
```


# 🌌 Pluto: Because Your Backend Deserves a Planet-Sized Upgrade!

## 🚀 Why Pluto? Because Earth-based Languages are So Last Season!

Pluto may have been demoted from planet status, but our Pluto is here to dominate the backend development galaxy! Prepare for liftoff with these cosmic features:

### 🧵 Thread/Channel Mechanism
- Powered by Go's goroutines (because why walk when you can warp-speed?)
- Multi-threaded like a spider on caffeine

### 💾 Database Library
- Currently supports PostgreSQL (MySQL got lost in a black hole)
- We're working on adapters for databases on other planets

### 📦 JSON Support
- Because even aliens communicate in key-value pairs

### 🔌 Plugin System
- Load existing Go packages faster than light-speed
- *Warning: May cause temporary warps in the space-time continuum*
- Currently available for Linux and MacOS (Windows users, please standby in the airlock)

### 🔧 Go Integration
- Access Go objects directly from Pluto
- It's like having a universal translator for programming languages!

## 🌠 Major Features (AKA "The Constellation of Awesomeness")

1. **Plugin System**: Use Go libraries so dynamically, you'll get motion sickness
2. **Multi-threaded Server**: Handles requests faster than you can say "Pluto is a planet!"
3. **REPL**: Run `pluto -i` and pretend you're commanding a spaceship


## 🛸 Installation

JUST COPY AND PASTE `this dir` TO YOUR %%PATH%% , WHETHER YOU ARE IN WINDOWS , LINUX OR EVEN MACOS, MAC SUCKS BTW

### 💻 Additional Installation Notes:
- WINDOWS USERS: PREPARE FOR BLUESCREENS OF JOY!
- LINUX USERS: SUDO MAKE ME A SANDWICH WHILE YOU WAIT!
- MACOS USERS: ... WELL, YOU'RE ALREADY USED TO THINGS NOT WORKING, RIGHT?

## 🎭 Disclaimer

Side effects of using Pluto may include:
- Uncontrollable urge to colonize other programming languages
- Delusions of backend grandeur
- Spontaneous outbursts of "To infinity... and beyond!"

Remember: In Pluto, no one can hear you scream... because our error handling is just that good! 🚀👩‍🚀👨‍🚀

# 👑 THE BOSS OF THE UNIVERSE 🌌

## 🚀 ATTENTION, PUNY EARTHLINGS! 👽

I, THE **MAGNIFICENT CREATOR** OF THIS _MIND-BLOWINGLY SUPERCOOL_ LANGUAGE, HEREBY DECREE:

1. 🦸‍♂️ ONLY *I* POSSESS THE COSMIC RIGHTS TO USE THIS FOR EVIL!
2. 🌈 MY CODE SPREADS JOY FASTER THAN A CAFFEINATED UNICORN!
3. 🎭 MY DEBUGGER FIXES BUGS AND BAD HAIR DAYS!

### BOW BEFORE MY SYNTACTIC SUGAR! 🍭

_P.S. If you find any bugs, they're actually "surprise features". You're welcome!_

**MWAHAHAHA!** 😂
