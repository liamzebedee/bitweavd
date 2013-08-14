Above all, your contribution is the most valuable thing. I love building BitWeav, and having other people with the same passion as you in life is a magnificent spectacle. 

# Contributing
Requirements:
 1. You need a [GitHub account](https://github.com/).
 2. You need a [good attitude](https://github.com/styleguide/words).
 3. You need to be okay with MIT licensing of your contributions.

GitHub issues is our hub for contribution. If you want something to do, look at the [current issues](https://github.com/bitweav/bitweavd/issues?labels=current&page=1&state=open). If you already know what you want to do, then [create an issue](https://github.com/bitweav/bitweavd/issues/new).

## Code
It is important you follow **ALL OF THESE STEPS** in sequential order.

**Setting up**:
 - BitWeav uses the [fork-pull](https://help.github.com/articles/using-pull-requests#fork--pull) model of development.
 - [Fork the repo](https://help.github.com/articles/fork-a-repo) to begin with, and start developing (we use the `master` branch).
 - After you have set up, get to writing code.

**Writing**: 
 - Ruby 1.9+ for the entirety of the project. 
 - Rakefile for building, Bundler for dependencies, Gem for distribution, Travis for continuous integration. 
 - **You need to commit any new files when developing**, as the gemspec uses git to list all the files of the project.
 - Your code should adhere to the [style guide](https://github.com/styleguide/ruby). 
 - **Master should always be kept stable!**
 - When you are done coding an aspect, you probably should test it.

**Testing**:
 - I'm focusing on implementation rather than prettiness, so we are currently using the vanilla TestCase for testing things.
 - Tests are located in */test*, and must be prefixed with `test_` in the filename. 
 - Look at an existing test for an example, they are very straightforward to understand.
 - Run the default rake task `rake` to build and test.
 - When you are done testing, and are sure it is stable, it's time to submit a pull request.
 
**Pull request**:
 - Make sure to commit and push your changes to your fork.
 - [Initiate a pull request](https://help.github.com/articles/using-pull-requests#initiating-the-pull-request)
 - Make sure to describe the changes, and reference any relevant issues. A descriptive title is key to getting it approved fast.

## Discussion
 - We use GitHub issues for all official discussion.
 - We make use of tags to make our lives easier. There are two tags `need` and `improvement` to denote the priority, and a single tag `current` to denote its status.
 - Please keep discussion productive. Humour is fine, but it needs to be accompanied by relevant discussion; don't turn an issue into the reddit comments section.
