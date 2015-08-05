Pod::Spec.new do |s|
  s.name             = "APExpandingTextView"
  s.version          = "0.1.0"
  s.summary          = "Simple Extension of UITextView that automatically extends the height of the textview while typing"
  s.description      = <<-DESC
                       Simple Extension of UITextView that automatically extends the height of the textview while typing

                       * Super simple to use, just treat it like a normal UITextView and it will do the rest
                       * Before And After Expansion Delegate Methods
                       DESC
  s.homepage         = "https://github.com/aadeshp/APExpandingTextView"
  s.license          = 'MIT'
  s.author           = { "Aadesh Patel" => "aadeshp95@gmail.com" }
  s.source           = { :git => "https://github.com/aadeshp/APExpandingTextView.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
end
