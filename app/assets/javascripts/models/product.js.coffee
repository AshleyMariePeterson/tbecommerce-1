App.Product = DS.Model.extend
  name: DS.attr 'string'
  description: DS.attr 'string'
  specs: DS.attr 'string'
  price: DS.attr 'number'
  product_category: DS.attr 'string'
  product_subcategory: DS.attr 'string'
  slug: DS.attr 'string'
  displayPrice: DS.attr 'string'
  category: Em.computed.alias 'product_category'
  product_type: Em.computed.alias 'product_subcategory'
  tagline: DS.attr 'string'

  catalogue_image: (->
    content = @get('images').content
    return '' if content.length is 0
    content[0].get('medium_url')
  ).property('images')

  productProperties: DS.hasMany 'product_property'
  images: DS.hasMany 'image'
  optionTypes: DS.hasMany 'option_type'
  colorTypes: DS.hasMany 'color_type'