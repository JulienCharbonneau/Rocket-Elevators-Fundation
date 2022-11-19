# README

This week, the project is about creating seven API for our website which will allow us to easily share with users, customers and employees.


## Google Maps
cloud.google.com

With Google Maps API, we can display the statistics of our customers.

![maps3](https://user-images.githubusercontent.com/113941321/201450156-27a55151-ff61-4ee8-bcfe-0dd6dd7d2878.png)

## Twilio

Create account in https://www.twilio.com/ and get the API key

Twilio send a text message to a number phone when status change to intervention. 

![File](https://user-images.githubusercontent.com/113941321/201450408-c7355812-ad77-4f7e-86b5-d998b536e6c1.jpg)


## Slack

1.First, create a new app, choose your app name (Homiesbot) and pick a workspace (Rocket Elevators). https://api.slack.com/

2.Add features and functionality, select Bots

3.Add scopes as needed. For our app, they are chat:write and chat:write:public

4.Install app to generate OAuth Token

5.Install gem
`gem 'slack-ruby-client'`
`gem 'async-websocket', '~> 0.8.0'`

6.When an elevator' status change, Homiesbot send a message in the slack's channel elevator_operations

![Homiesbot](https://user-images.githubusercontent.com/113941321/201450221-f027315b-285a-480d-8dad-ada31573e2bc.png)


## Dropbox API 
1.Create a Dropbox accout if you don't have one link: https://www.Dropbox.com action: create an account (to this project we can use the email: lauranavp@hotmail.com/ password: codeboxx2020)

2.Create an App on Dropbox platform link: https://www.Dropbox.com/developers/apps action: Specify a name for you app and you will given App Key and App Secret remarks: App can have access to whole Dropbox or just a specific folder.(App: RocketCustomers)

3.Your generate access token expires in a few hours, it is important to have access to the dropbox account (email , password) to refresh a new token.

4.Try this basic tutorial to test what you can do link: https://www.Dropbox.com/developers-v1/core/start/ruby 

5.To Use Dropbox with rails install the Gem and follow the instructions in the link:  https://github.com/Jesus/dropbox_api

6.Don't forget to put your key token in application.yml file to hide it.

After installation

In my case I generated the connection in my customer model. When a person fills out a contact us and becomes a customer, I will create a folder with their name in the dropbox account and save their attached file if they have one. An idea of how I made my code:


![dropboxcodepng](https://user-images.githubusercontent.com/113923422/201444839-0f134e6e-d82d-40a9-8e0d-86612f794a4a.png)

Don't forget to put require dropbox_api at the beginning of your code:
![requirepic](https://user-images.githubusercontent.com/113923422/201445039-63e174ad-cbf7-4f98-8b37-6a75b3053baa.png)


## Sendgrid API

1.First, create account and API Key via https://sendgrid.com/

2.Install gem
`gem 'sendgrid-ruby'`

3.When someone submit a Contact Us form, an email is sent via SendGrid

![sendgrid](https://user-images.githubusercontent.com/113941321/201450190-48475359-5276-4be7-af2b-4a1e45598b65.png)


## Amazon Polly

https://aws.amazon.com/fr/polly/

![amazon polly](https://user-images.githubusercontent.com/113941321/201450638-6d2b8e5f-8a60-4e3a-ad8c-a0fcbfd2985e.png)

## FreshDesk

https://codeboxx-support.freshdesk.com/
email: freshdesk123api@gmail.com
password: codeboxx2022

![freshDesk](https://user-images.githubusercontent.com/113941321/201451081-3827b207-7092-4c1f-92bd-b50776f9c6eb.png)


## Token and API key
It is important to secure all token and API keys. Use application.yml and database.yml


