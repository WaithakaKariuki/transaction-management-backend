# app/constraints/valid_http_method.rb
class ValidHttpMethod
    def initialize(*allowed_methods)
      @allowed_methods = allowed_methods.map(&:to_s).map(&:upcase)
    end
  
    def matches?(request)
      @allowed_methods.include?(request.method)
    end
  end
  