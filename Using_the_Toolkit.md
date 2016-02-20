# Using Force.com for Facebook #

## Abstract ##

This section will show you how to take advantage of Facebook markup language within Apex code.

## Facebook Namespace ##

In order to use the Facebook namespace 

&lt;fb:componentName /&gt;

, you need to define it in the same tag by adding the XML namespace (xmlns) parameter.

<fb:componentName xmlns:fb="http://www.facebook.com/2008/fbml" />
## Login a User ##

Lorem ipsum
## Up and Running with XFBML ##

Lorem
## Testing ##

So you've built a marvelous application using the Force.com for Facebook toolkit. Now what? You need to make sure that you have written test cases for your new application. Just like any other application developed on Force.com, you must achieve 75% or higher average test coverage across your application.

There are a few things you need to know in order to accomplish adequate test coverage when using the Force.com for Facebook toolkit because it uses Web Services. The difficulty in testing these types of applications comes from us not wanting to actually exercise the web service in our test methods.

Dave Carroll has a writeup on how to accomplish this using Virtual Callout Testing.