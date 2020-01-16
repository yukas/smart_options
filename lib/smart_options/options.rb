module SmartOptions
  class Options
    def self.option(name, params)
      @@__options__ ||= {}
      @@__options__[name] = params

      define_method name do
        instance_variable_get("@#{name}") || params[:default]
      end

      define_method :"#{name}=" do |value|
        instance_variable_set("@#{name}", value)
      end
    end

    def initialize(params = {})
      wrong_keys = params.keys - @@__options__.keys

      raise "Wrong options supplied: #{wrong_keys}" if !wrong_keys.empty?

      required_options = @@__options__.select { |k, v| v[:required] }
      missing_options_keys = required_options.keys - params.keys

      raise "Missing required options: #{missing_options_keys}" if !missing_options_keys.empty?

      params.each do |k, v|
        instance_variable_set("@#{k}", v)
      end
    end
  end
end
