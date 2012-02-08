# FormtasticDatepickerInputs
module Formtastic::Inputs

  class DatePickerInput < Formtastic::Inputs::StringInput

    def to_html
      input_wrapping do
        label_html <<
          builder.text_field(input_name, input_html_options)
      end
    end

    def format
      input_options[:format] || Date::DATE_FORMATS[:default]
    end

    def value
      input_options[:value] || object.send(method).try(:strftime, format)
    end

    def css_class
      "ui-date-picker"
    end

    def input_html_options
      new_class = [super[:class], css_class].compact.join(" ")
      super.update(:class => new_class, :value => value)
    end
  end

  class DateTimePickerInput < Formtastic::Inputs::DatePickerInput

    def format
      input_options[:format] || Time::DATE_FORMATS[:default]
    end

    def css_class
      "ui-datetime-picker"
    end

  end

end
