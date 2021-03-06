App.ApplicationRoute = Em.Route.extend({
  cart: Em.inject.service('cart'),
  model() {
    let { store } = this;
    return store.findAll('product').then(() => {
      return Em.RSVP.hash({
        customItems: store.findAll('custom-item')
      });
    }).then((data) => {
      data.customItems.forEach((item) => {
        item.validateDataIntegrity();
      });
      // let carts = data.carts.filterBy('isCreated', true);
      // if (carts.get('length') === 0) {
      //   var cart = store.createRecord('cart',
      //     {state: 'cart'});
      //   return cart.save();
      // } else {
      //   var cart = carts.shiftObject();
      //   return cart.fetchOrder().then(() => cart);
      // }
    }).catch(() => {
      localStorage.removeItem('TrashBagsCustomItem');
      localStorage.removeItem('TrashBagsCard');
      localStorage.removeItem('TrashBagsCart');
      this.refresh();
    });
  },

  actions: {
    openModal(template, model) {
      return this.render(template, {
        into: 'application',
        outlet: 'modal',
        controller: template,
        model
      });
    },

    closeModal() {
      return this.disconnectOutlet({
        outlet: 'modal',
        parentView: 'application'
      });
    },

    customBuilderWithProduct(product) {
      let item = this.store.createRecord('custom-item', {
        inShop: true,
        shop_state: 'colors'
      });
      item.set('productId', product.get('id'));
      item.reloadRelationships();
      item.save();
      return this.transitionTo('custom', item);
    },

//todo: refactor
    addToCart(item) {
      let self = this;
      if (item.get('inCart')) {
        item.set('inShop', false);
        item.save();
        this.transitionTo('cart');
        return;
      }
      let cart = this.get('cart');
      let orderPromise = cart.getOrder();
      orderPromise.then((cart) => {
        debugger
      });
      return order.createLineItem(item).then(function() {
        if (item.isCustomItem) {
          item.set('inShop', false);
          item.save();
        }
        return self.transitionTo('cart');
      }, (xhr) => {
        let hasErrors = xhr.responseJSON && xhr.responseJSON.errors && xhr.responseJSON.errors.quantity;
        if (!item.isCustomItem && hasErrors) {
          alert('The item you tried to add to cart is no longer in stock');
        }
      });
    }
  }
});
