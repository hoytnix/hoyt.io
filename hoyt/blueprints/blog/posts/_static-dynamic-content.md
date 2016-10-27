Something I would like to explore today is enabling users of your static-website
to submit content, which will be added to the website.

Immediately there are two methods which come to me:
+ Forms submit POST requests to a JSON-API server, and the website makes GET requests via Ajax on every page-request.
+ Forms submit POST requests to a JSON-API server, and a separate server polls the server and compiles new versions on changes.

I will be looking mostly at the second method, but before I do that I'm going to outline some of the problems with the former method:
+ Although much easier to implement, the idea of repeating the same request to serve the same content defeats to the purpose of static-servers to me. I believe that static-servers should do as little work as possible to serve content to the user, and utilizing the browser for rendering should be considered.
+ Requests are not deterministic: while we can verify that our HTML, styles, and scripts should be the same every time, external requests can fail to complete in a timely manner and leave significant portions of our webpages empty or unfinished looking.
+ Users without JavaScript enabled are not able to use significant portions of our applications! While this probably isn't important for our product-users, this may be important if you want to utilize search-engines for traffic; consider whether the content you're serving via JavaScript is something search-engines should see, and if necessary how to implement _noscript_ to leave a partial result. (However, _both_ methods require JavaScript for form-submission.)
+ Ajax and JavaScript can be detrimentally slow on mobile (although honestly if this is your problem, you most likely have other performance issues you could more immediately address [TODO: detail]). I personally have a fear of using certain applications such as shopping and financial because I know how many times I've seen that spinner sit there for more than a couple minutes. ):

On the other hand, the model of recompiling changes and serving them completely statically introduces its own oddities:
+ How often are you going to poll the server? Quality assurance tests and automatic deployments may take a minute or two. Users aren't familiar with seeing a message telling them that their content will be available in 5-10 minutes!
+ Do you want your server to be running 24/7 or only during certain hours? You may tell your users that they can only see changes to their content between 9-5.
+ What happens if one deployment doesn't finish before the next is scheduled? [TODO: glossary: race-conditions]

While all these issues may seem difficult to immediately deal with, by the time we are finished addressing each one you will be confident that you can build a static-server which is ready to scale.
