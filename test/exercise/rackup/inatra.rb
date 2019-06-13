module Inatra
  class << self
    def method_missing(m, *args, &block)
      @routes ||= {}
      if m.to_s =~ /get/
        @routes[:get] ||= {}
        @routes[:get][args.first.to_s] = block
      elsif m.to_s =~ /post/
        @routes[:post] ||= {}
        @routes[:post][args.first.to_s] = block
      else
        super
      end
    end

    def routes(&block)
      instance_eval(&block)
    end

    def call(env)
      method = env['REQUEST_METHOD'].downcase.to_sym
      path = env['PATH_INFO']
      return [404, {}, ['Not found']] if @routes[method][path].nil?
      @routes[method][path].call
    end
  end
end
