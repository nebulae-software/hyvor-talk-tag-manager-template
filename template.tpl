___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Hyvor Talk (Unofficial)",
  "categories": [
    "SOCIAL",
    "CHAT"
  ]
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "Hyvor Talk is a commenting platform that can be integrated into any website. This template is unofficial.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "websiteID",
    "displayName": "Website ID (identifier provided by Hyvor Talk)",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NUMBER"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

var log = require('logToConsole');
var isConsentGranted = require('isConsentGranted');
var injectScript = require('injectScript');
var setInWindow = require('setInWindow');
var copyFromWindow = require('copyFromWindow');

if (isConsentGranted('functionality_storage')) {
  var pageId = copyFromWindow('HYVOR_PAGE_ID');
  setInWindow('HYVOR_TALK_WEBSITE', data.websiteID, true);
  setInWindow('HYVOR_TALK_CONFIG', {
      url: false,
      id: pageId
  }, true);
  
  injectScript('https://talk.hyvor.com/web-api/embed.js', function() {}, data.gtmOnFailure);
}

data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_consent",
        "versionId": "1"
      },
      "param": [
        {
          "key": "consentTypes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "functionality_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://talk.hyvor.com/web-api/embed.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "HYVOR_TALK_WEBSITE"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "HYVOR_TALK_CONFIG"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "HYVOR_PAGE_ID"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Do not launch if functionality consent is not granted
  code: |-
    const mockData = {
      websiteID: '1234'
    };

    mock('injectScript', function(url, onSuccess, onFailure) {
      onSuccess();
    });
    mock('isConsentGranted', false);

    runCode(mockData);

    assertApi('setInWindow')
      .wasNotCalled();
    assertApi('injectScript')
      .wasNotCalled();
    assertApi('gtmOnSuccess')
      .wasCalled();
- name: Launch script if consent is granted
  code: |-
    const mockData = {
      websiteID: '1234'
    };

    mock('injectScript', function(url, onSuccess, onFailure) {
      onSuccess();
    });
    mock('isConsentGranted', true);
    mock('copyFromWindow', 'pageID');

    runCode(mockData);

    assertApi('injectScript')
      .wasCalled();
    assertApi('gtmOnSuccess')
      .wasCalled();
- name: Script config is set on Window before script injection
  code: |-
    const mockData = {
      websiteID: '1234'
    };

    mock('injectScript', function(url, onSuccess, onFailure) {
      onSuccess();
    });
    mock('isConsentGranted', true);
    mock('copyFromWindow', 'pageID');

    runCode(mockData);

    assertApi('injectScript')
      .wasCalled();
    assertApi('gtmOnSuccess')
      .wasCalled();

    assertApi('setInWindow')
      .wasCalledWith('HYVOR_TALK_WEBSITE','1234', true)
      .wasCalledWith('HYVOR_TALK_CONFIG', {
        url: false,
        id: 'pageID'
      }, true);
    assertApi('injectScript')
      .wasCalled();
- name: Tag fails if script is not loaded correctly
  code: |-
    const mockData = {
      websiteID: '1234'
    };

    mock('isConsentGranted', true);
    mock('injectScript', function(url, onSuccess, onFailure) {
      onFailure();
    });

    runCode(mockData);

    assertApi('gtmOnFailure')
      .wasCalled();
- name: Tag opening Hyvor Talk script
  code: |
    const mockData = {
      websiteID: '1234'
    };

    var scriptUrl = '';
    mock('injectScript', function(url, onSuccess, onFailure) {
      scriptUrl = url;
      onSuccess();
    });
    mock('isConsentGranted', true);

    runCode(mockData);

    assertThat(scriptUrl)
      .isEqualTo('https://talk.hyvor.com/web-api/embed.js');
setup: ''


___NOTES___

Created on 20/04/2022, 00:25:09


