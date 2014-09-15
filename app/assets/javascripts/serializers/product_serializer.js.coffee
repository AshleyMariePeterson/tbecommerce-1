decamelize = Ember.String.decamelize
capitalize = Ember.String.capitalize
camelize = Ember.String.camelize
forEach = Ember.EnumerableUtils.forEach
underscore = Ember.String.underscore

App.ProductSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    productProperties: embedded: 'always'
    images: embedded: 'always'
    optionTypes: embedded: 'always'
    colorTypes: embedded: 'always'

  extractMeta: (store, type, payload)->
    metadata = {}
    Em.$.each payload, (key, value)->
      if (key != type.typeKey && key != type.typeKey.pluralize())
        metadata[key] = value
        delete payload[key]
    store.metaForType(type, metadata)

App.ProductAdapter = DS.RESTAdapter.extend
  namespace: 'api'

App.OptionTypeSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    optionValues: embedded: 'always'

App.ColorTypeSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    colorValues: embedded: 'always'
