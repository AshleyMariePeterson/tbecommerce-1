# Trashbags.ProductsController = Em.ArrayController.extend
# 	categories: (->
# 		@get('content').mapBy('category').uniq()
# 		).property()
# 	types: (->
# 		@get('content').mapBy('type').uniq()
# 		).property('content')
# 	bagTypes: (->
# 		products = @get('content').filterBy('product_category', 'bag').sortBy('price')
# 		types = products.mapBy('type').uniq().map (item, index, object)->
# 			val = {}
# 			val.name = item.capitalize()
# 			val.products = products.filterBy('type', item)
# 			return val
# 		).property('categories')
# 	apparelTypes: (->
# 		products = @get('content').filterBy('product_category', 'apparel').sortBy('price')
# 		types = products.mapBy('type').uniq().map (item, index, object)->
# 			val = {}
# 			val.name = item.capitalize()
# 			val.products = products.filterBy('type', item)
# 			return val
# 		).property('categories')
# 	utilityTypes: (->
# 		products = @get('content').filterBy('product_category', 'utility').sortBy('price')
# 		types = products.mapBy('type').uniq().map (item, index, object)->
# 			val = {}
# 			val.name = item.capitalize()
# 			val.products = products.filterBy('type', item)
# 			return val
# 		).property('categories')
# 	imagesByType: (->
# 		content = @get('content').sortBy('type')
# 		images = {}
# 		@get('content').forEach (item)->
# 			type = item.get('type')
# 			item_images = item.get('images')
# 			images[type] = images[type] || []
# 			item_images.forEach (item, index, array)->
# 				images[type].push item._data
# 		return images
# 		).property('this')