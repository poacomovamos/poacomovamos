// Karma configuration
// Generated on Sun Jul 14 2013 02:35:37 GMT-0300 (BRT)
module.exports = function(config) {
  config.set({

    // base path, that will be used to resolve files and exclude
    basePath: '',

    // frameworks to use
    frameworks: ['jasmine'],

    // list of files / patterns to load in the browser
    files: [
      'public/js/vendor/angular.js',
      'public/js/vendor/angular-mocks.js',
      'public/js/**/*.js',
      'test/js/**/*.js'
    ],

    // list of files to exclude
    exclude: [
      'public/js/vendor/bootstrap.js',
      'public/js/vendor/bootstrap.min.js'
    ],

    // test results reporter to use
    // possible values: 'dots', 'progress', 'junit', 'growl', 'coverage'
    reporters: ['dots'],

    // web server port
    port: 9876,

    // cli runner port
    runnerPort: 9100,

    // enable / disable colors in the output (reporters and logs)
    colors: true,

    // level of logging
    // possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
    logLevel: LOG_DISABLE,

    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: false,

    // Start these browsers, currently available:
    // - Chrome
    // - ChromeCanary
    // - Firefox
    // - Opera
    // - Safari (only Mac)
    // - PhantomJS
    // - IE (only Windows)
    browsers: ['PhantomJS'],

    // If browser does not capture in given timeout [ms], kill it
    captureTimeout: 60000,

    // Continuous Integration mode
    // if true, it capture browsers, run tests and exit
    singleRun: true,

    // plugins to load
    plugins: [
      'karma-jasmine',
      'karma-phantomjs-launcher'
    ]
  });
};
