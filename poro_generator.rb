require 'pry'
require 'yaml'

filepath  = './resources.yaml'
data      = YAML.load_file(filepath)
location  = 'lib/pivnet_api/v2/models'
namespace = 'PivnetApi::V2'

class String
  def underscore
    return self unless self =~ /[A-Z-]|::/
    word = gsub('::', '/')
    word.gsub!(/(?:(?<=([A-Za-z\d]))|\b)(#{/(?=a)b/})(?=\b|[^a-z])/) { "#{$1 && '_'}#{$2.downcase}" }
    word.gsub!(/([A-Z\d]+)([A-Z][a-z])/, '\1_\2')
    word.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
    word.tr!("-", "_")
    word.downcase!
    word
  end
end

data.each do |class_name, attributes|
  code = <<~KLASS
    class #{[namespace, class_name].compact.join("::")}
      attr #{attributes.keys.map(&:to_sym).map(&:inspect).join(', ')}

      def initialize(#{attributes.keys.map{|attr| "#{attr}: nil" }.join(', ')})
        #{attributes.keys.map{|attr| "@#{attr}" }.join(", ")} = #{attributes.keys.join(", ")}
      end
    end
  KLASS

  path = File.join(location, "#{class_name.underscore}.rb")
  puts path
  File.write(path, code)
end
