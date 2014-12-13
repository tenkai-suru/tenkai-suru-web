## Tiramisu

[![Build Status](https://travis-ci.org/tenkai-suru/tenkai-suru-web.svg)](https://travis-ci.org/tenkai-suru/tenkai-suru-web)

### Under Construction

#### How to start Developing on the App

##### Install the required tools
* [node.js](http://nodejs.org/)

##### Resolving Dependencies:
* `$ npm install`
* `$ $(npm bin)/bower install`

##### Start Developing

Ensure the tests are passing:

```
$ npm test
```

Run the server:

```
$ npm start
```

__Rules dictating development practices comming soon__

This project is using grunt, you may be interested in these tasks:
* Running tests: `grunt spec`
* Autorunning tests for a sweet development feedback loop: `grunt autotest`
* Spin up a server (port 3333) to see it live: `grunt serve`
* Building a minified versions (used for prod, but what the heck): `grunt build`

**Note**: you may need to run `npm install -g grunt` to make the grunt binary available globally, or alternatively prepend each of the previous commands with `$(npm bin)/`, e.g. `$(npm bin)/grunt spec`.
