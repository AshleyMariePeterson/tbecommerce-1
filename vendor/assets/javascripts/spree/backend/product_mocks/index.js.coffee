$ ->
  ($ '#new_product_mock_link').click (event) ->
    event.preventDefault()

    ($ '.no-objects-found').hide()

    ($ this).hide()
    $.ajax
      type: 'GET'
      url: @href
      data: (
        authenticity_token: AUTH_TOKEN
      )
      success: (r) ->
        ($ '#product_mocks').html r