require "setting_macro/version"

module SettingMacro
  Undefined = Object.new.freeze

  def setting(name, default: nil)
    mod = Module.new
    mod.module_eval <<-RUBY, __FILE__, __LINE__ + 1
      def #{name}(value = ::SettingMacro::Undefined)
        if value == ::SettingMacro::Undefined
          defined?(@#{name}) && @#{name}
        else
          @#{name} = value
        end
      end
    RUBY

    mod.send(:define_method, :inherited) do |klass|
      super(klass)

      # Make sure we inherit properly
      klass.public_send(name, send(name))
    end

    mod.send(:define_singleton_method, :extended) do |base|
      # Set the default value
      base.public_send(name, default)
    end

    extend(mod)
  end
end
