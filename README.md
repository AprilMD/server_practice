How to:

1. Create a project 
2. Add rspec - ```bundle add rspec --skip-install```
3. Add sinatra ```bundle add sinatra```
4. Add rack-test ```bundle add rack-test``` - allows us to run tests on the sinatra part of the code
5. ```bundle add sinatra-contrib```
(reloads page as you save it so you don't have to keep bundle exec file_name.rb)
6. Install files added to bundle ```bundle install --path vendor/bundle```

4. create a server file - ```touch server.rb```
--> within this: ```require 'sinatra'```
```require 'sinatra/reloader' if development?``` (allows saving and reloading at the same time)

5. 
```
Get ‘/’ do
	‘Hi Grandma!’
End

Get ‘/sassy’ do
	‘Hi, Sassy grandma!’
End


Get ‘/:name?’ do |name|
	“Hi #{name}”
End
(→ question mark means it will work even if no parameter is passed)

Get ‘/:name?’ do |name| 
“<h1>Hi, my name is #{name}</>”	→ add html

End
```

To run this:

```bundle exec ruby server.rb```

6. To use information in browser with dynamic request:

Mkdir views
Cd views
Touch index.erb (this can also be a regular html file, but has to have .erb suffix)
<html>
<h1> Hi, <%=name%>, welcome to grandma’s server</>
</html>

Server.rb →
Get ‘/:name?’ do |name|
Erb:index, :locals => {:name=>name}

End

TESTING


Testing for what it is that you want the webpage to do.

Bundle exec rspec –init → adds spec file
Bundle add rack
Within it:

require _relative ‘..server’
Require ‘rspec’
Require ‘rack/test’

RSpec.describe “Grandma’s server” do
	Include Rack: :Test: : Methods

Def app
	Sinatra::Application
End

It ‘should give me back a greet if there is no parameter’ do
Get ‘/’
expect(last_response).not be_ok
End

→ fails
It ‘should give me back a greet if there is no parameter’ do
Get ‘/’
expect(last_response).to be_ok → 200 response message
expect(last_response.body).to include(Grandma)
End

→ passes

It ‘should give me back a greeting with my name’ do
	Get ‘/Dom’
		expect(last_response.body). To include(“Dom”)

		End

Could check for things like H1 tag, image tag etc
Check for subtitles

7. To look at your webpage use ```localhost:4567``` in your browser bar
    7.a. ```localhost:4567/April``` - you can view a name

# Things to Try

1. Build your own webserver using Sinatra-mine is there, but it would be good if you showed grandma you can make your own, too.

2. Create an endpoint that returns a standard greeting a. Can you make this greeting dynamic? b. What if no parameter is given? Can you make the greeting making sense? No Hi, ,! Nice to meet you!

3. Write a test for your greeting

4. Build a second page using TDD that returns some HTML. In this page, add an image of something your grandparent would like!

5. Add CSS to your second page.

6. Could you build a web server WITHOUT Sinatra?

