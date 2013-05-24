Due to the unique nature of this project, there is no necessity to run a locally hosted server. Simply by visiting src/index.html you can view the most recent version of the bitWeav client. However because we use Github as our hosting infrastructure, we need to maintain a stable version on a seperate branch - **gh-pages**, which is then served to the end user. 

Both the documentation and source files are kept on the **master** branch. The **gh-pages** branch is updated to new stable versions manually (if you think you have a better way of doing this, tell me!). 

# Technologies
* [Bootstrap](http://twitter.github.io/bootstrap/) as a general CSS framework ([JQuery](http://jquery.com/) included for transitions and more). 
* [Less](http://lesscss.org/) for cleaner CSS styling. 
* [RequireJS](http://requirejs.org/) for JS modularity. 
* [AngularJS](http://angularjs.org/) used as a general web application framework.

We use the [Cache Manifest](https://en.wikipedia.org/wiki/Cache_manifest_in_HTML5) feature of HTML5 to provide offline access to the web application.
