title=RubyMotion
tags=platform, ios, macos, android
summary=Bridge for writing cross-platform apps in Ruby.
~~~~~~

[Website](http://www.rubymotion.com/)

### Examples

Android HelloWorld
```ruby
class MainActivity < Android::App::Activity
  def onCreate(savedInstanceState)
    puts "Hello World!"
    super
    view = Android::Widget::TextView.new(self)
    view.text = "Hello World!"
    self.contentView = view
  end
end
```

iOS HelloWorld
```ruby
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    true
  end
end

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    alert = UIAlertView.new
    alert.message = "Hello World!"
    alert.show
    true
  end
end
```

