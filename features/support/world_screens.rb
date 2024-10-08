module WorldScreens

  #
  # The screen_objects method returns a hash table of your native apps app's screen objects and associated screen
  # classes to be instantiated by the TestCentricity ScreenManager.
  #
  # iOS Screen Object class definitions are contained in the features/support/ios folder.
  # Android Screen Object class definitions are contained in the features/support/android folder.
  # MacOS Screen Object class definitions are contained in the features/support/mac folder.
  #
  def screen_objects
    case ENV['PLATFORM'].downcase.to_sym
    when :ios, :android
      app_screen_objects
    when :mac
      mac_screen_objects
    end
  end

  def app_screen_objects
    {
      base_rn_demo_app_screen:  BaseRNDemoAppScreen,
      about_screen:             AboutScreen,
      login_screen:             LoginScreen,
      webview_screen:           WebViewScreen,
      web_page_screen:          WebPageViewerScreen,
      products_screen:          ProductsScreen,
      product_item_screen:      ProductItemScreen,
      cart_screen:              CartScreen,
      checkout_address_screen:  CheckoutAddressScreen,
      checkout_payment_screen:  CheckoutPaymentScreen,
      checkout_review_screen:   CheckoutReviewScreen,
      checkout_complete_screen: CheckoutCompleteScreen,
      qr_code_scanner_screen:   QRCodeScannerScreen,
      drawing_screen:           DrawingScreen,
      api_calls_screen:         ApiCallsScreen,
      geo_location_screen:      GeoLocationScreen,
      biometrics_screen:        BiometricsScreen,
      saucebot_video_screen:    SauceBotScreen,

      base_wdio_demo_app_screen: BaseWDIODemoAppScreen,
      form_screen:               FormScreen,
      swipe_screen:              SwipeScreen,
      drag_drop_screen:          DragDropScreen
    }
  end

  def mac_screen_objects
    {
      calculator_screen: CalculatorAppScreen,
      about_dialog:      AboutDialogScreen,
      paper_tape_screen: PaperTapeScreen
    }
  end
end


World(WorldScreens)
