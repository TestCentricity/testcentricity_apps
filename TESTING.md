# How TestCentricity™ For Apps Is Tested

The TestCentricity™ For Apps core framework gem is tested prior to every release using a combination of test specs (RSpec)
and Cucumber feature tests. Test specs and Cucumber features are executed on a combination of Apple MacOS Ventura running
on Macs with Intel CPUs (x86 architecture) and MacOS Sequoia running on Macs with Apple Silicon CPUs (arm64 architecture).

The `Rakefile` in this repository defines the individual test spec and Cucumber feature tasks, as well as tasks for running
combinations of specs and cukes for required, cloud, smoke, regression, and release categories.

## Test Specs

Native mobile app test specs are used to verify connectivity to the [Sauce Labs React Native Demo app](https://github.com/saucelabs/my-demo-app-rn) on the following
target platforms:
* locally hosted iOS device simulators (using Appium and XCode on macOS)
* locally hosted Android Studio virtual device emulators (using Appium and Android Studio)
* cloud hosted physical devices or simulators from the following service:
  * Browserstack
  * Sauce Labs
  * TestingBot

MacOS Desktop app test specs are used to verify connectivity to Apple's built-in MacOS Calculator app on the Mac computer
being used as the local test host.


## Cucumber Features

Cucumber feature tests are used to verify the gem's Screen Object Model implementation using the following native mobile
apps and MacOS destop apps:
* [version 1.3.0](https://github.com/saucelabs/my-demo-app-rn/releases/tag/v1.3.0) of the [Sauce Labs React Native Demo app](https://github.com/saucelabs/my-demo-app-rn)
* [version 1.0.8](https://github.com/webdriverio/native-demo-app/releases/tag/v1.0.8) of the [WebDriverIO Demo app](https://github.com/webdriverio/native-demo-app)
* version 10.16 of the MacOS Calculator app, which is included with MacOS Ventura
* version 6.0 of the MacOS Shortcuts app, which is included with MacOS Ventura

The Cucumber test suite includes scenarios for interacting with and validating the following functionality:
* Switches
* Listviews
* Alert modals
* Menubars, menu items, and popup menus (MacOS only)
* Tables (MacOS and iOS/iPadOS only)
* Carousel lists
* Swipe gestures
* UI element drag and drop actions
* Populating forms with data
* Navigation metaphors
* Verification of multiple properties of multiple screen UI elements
* Deep linking
* Drawing
* WebViews
* Logging in using Biometrics (Face ID on iOS only)

Cucumber feature tests are executed against the following target platforms:
* locally hosted iOS device simulators (using Appium and XCode on macOS)
* locally hosted Android Studio virtual device emulators (using Appium and Android Studio)
* local hosting MacOS computer
