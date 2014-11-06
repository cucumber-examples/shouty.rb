# Shouty

Shouty is a social networking application for short physical distances.
When someone shouts, only people within 500m kan hear it.

Shouty doesn't exist yet - you will implement it yourself!

That is, if you're attending a BDD/Cucumber course.

## Agenda

### Get the code

Git:

    git clone https://github.com/cucumber-ltd/shouty.rb.git
    cd shouty.java

Subversion:

    svn checkout https://github.com/cucumber-ltd/shouty.rb/trunk shouty
    cd shouty.java

Or simply [download](https://github.com/cucumber-ltd/shouty.rb/releases) a zip or tarball.

### Install Ruby (Windows)

* Download [Ruby 2.0.0](http://rubyinstaller.org/downloads/) *DO NOT CHOOSE x64*
  * Check "Add to PATH" box during installation (don't check the other boxes)

### Install Ruby (OS X / Linux)

You might already have ruby installed. Check if it's an old one:

    ruby --version

If this is `1.9.3` or more recent you're good to go. If not, install ruby with
[ruby-install](https://github.com/postmodern/ruby-install):

    ruby-install ruby 2.1

### Install a Text editor

Any text editor will work, but if you don't have one we recommend
[Sublime](http://www.sublimetext.com/3) (Works on Windows/Mac/Linux).

### Set up environment

The steps below might fail if you're behind a proxy. See the HTTP_PROXY section
for details and try again when you have set the proxy.

* Run `gem install bundler`
* Run `bundle`
* Run `cucumber`

You should see:

    1 scenario (1 passed)

### HTTP_PROXY

Your IT department should be able to tell you what the proxy URL is.

#### Windows

* Right-click My Computer, and then click Properties
* Click the Advanced tab
* Click Environment variables
  * Click New to add a new user variable
  * Name: `HTTP_PROXY`
  * Value: What the IT department told you

On OS X / Linux:

    export HTTP_PROXY=<What the IT department told you>

## Brainstorm capabilities

* Who are the main stakeholders?
* What can people do with the app?
* What are the main differentiators from other apps?

### Pick one capability

* Define rules
* Create high level examples (Friends episodes)

Then do this for each example to discover more examples:

* Can you think of a context where the outcome would be different?
* Are there any other outcomes we haven't thought about?

### Implement one capability. Text UI only.

* Write a Cucumber Scenario for one of the examples
* Make it pass!
