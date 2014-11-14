App.ProductOptionMixin = Em.Mixin.create
  name: DS.attr 'string'
  presentation: DS.attr 'string'
  position: DS.attr 'number'

App.OptionType = DS.Model.extend App.ProductOptionMixin,
  optionValues: DS.hasMany 'option_value'
  description: DS.attr 'string'
  required: DS.attr 'boolean'
  catalogue: DS.attr 'boolean'
  thumb_url: DS.attr 'string'
  medium_url: DS.attr 'string'
  large_url: DS.attr 'string'

App.ColorType = DS.Model.extend App.ProductOptionMixin,
  selector: DS.attr 'string'
  colorValues: DS.hasMany 'color_value'
  line_color: DS.attr 'boolean'