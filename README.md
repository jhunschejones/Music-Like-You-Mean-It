# Music Like You Mean It

[![CI](https://github.com/jhunschejones/Music-Like-You-Mean-It/actions/workflows/ci.yml/badge.svg)](https://github.com/jhunschejones/Music-Like-You-Mean-It/actions/workflows/ci.yml)

## Overview
Music Like You Mean It is a Rails 6 web app that I use to deliver online music production training content.

## Background
I started this site using a CMS platform, and after a few months realized that I could build a much smaller site on my own that still met all my needs and delivered the same customer experience. The main purpose of the app is to house blog posts and links to youtube videos for training content I have created. Users can subscribe to news and updates, and the app will notify them of all new blog posts. As the admin, I can also log in and add new content, write emails, and manage users as needed.

I had a good experience working with the previous CMS platform, but in moving to my own site, I was also able to make all the little user experience and responsive UI tweaks I wanted. This resulted in a site that feels about 10% more polished than the original, and it's quite fun to use from the admin side as well! I used the opportunity to streamline parts of my workflow that I do the same every time so that it is even easier to upload new content and create emails to the site users.

## Lessons learned
Building out this app really expanded my Rails knowledge in some key areas. I worked with emails at a greater level of detail than I ever have before in a Rails app, gained experience designing and building a CMS backend, added custom pagination and error pages, and much more!

### Emails in Rails
I have written a few apps that send automatic email updates before, but Music Like You Mean It has by far the most advanced email integration I've worked on in a personal site to date. To start with, I created an email template that includes the styling, layout, and basic content that I found myself copying and pasting into each new email in my previous platform. This allows the daily emails to look uniform and saves me some time along the way!

Music Like You Mean It uses Mailgun in production, a tool I used before at work but one I had never built an integration with from scratch. Mailgun gem provides a great starting place and I found I was able to get up and running in no time. To keep the process simple, I implemented my own unsubscribe flow rather than using Mailgun's. I always strive to make sure user data is secure and that the users can control their own data. To do this, I added secure unsubscribe links to the bottom of my email template which allow users to fully delete all their data in two clicks.

Finally, working on email formatting in development, and writing emails in the CMS backend in production, required balancing the preview functionality in both environments. I worked with Rails email previews for the first time which was really neat, but also still didn't provide the whole picture. I quickly found out that email html standards are in a much different era than normal web layout standards. As a result, the Rails previous showed me what I wanted to see but most email clients were still unable to read the layout I had created.

After adjusting the layout to use the tried and true, vintage html layout tools that emails have been using for years now, I built out preview functionality that I could use in the CMS back end. I made sure to use the same html layout that was implemented in the email templates, and this helps me see more clearly on the fly how my emails are going to turn out. As a bonus, I also added test email functionality accessible from this preview. This will quickly shoot a real version of the email to my inbox so that I can make sure everything is laid out as I intended.

### Custom error pages
In general, when I'm building fairly straight-forward apps I try to make it hard for users to end up at a URL that doesn't exist. Inevitably it will happen though, so I decided to send errors through the normal router with `config.exceptions_app = self.routes`. I could then respond to a set of errors that I wanted to handle with a more nicely formatted error page that provides a redirect back to the home page. I chose this approach rather than replacing the default error pages in Rails so that the app can still fall back to those in prod if something goes _terribly_ wrong, but my expected error pages can take advantage of my static page template and formatting so that it will be easier for them to match the rest of the site.

### Paginating blog posts
There are many ways to implement pagination, and I chose to start with the `will_paginate` gem. I am using the Bulma CSS framework for this app, so I also found a `will_paginate-bulma` gem that builds off of `will_paginate` with easy access to Bulma styling.

As I worked on building a responsive layout, I discovered that I had a very specific style in mind for the blogs pagination once it exceeded a few pages of content. I picked up where `will_paginate-bulma` left off, and implemented my own version of the library so that I could specify how many page numbers to show at once. After getting this working smoothly, I paid it forward with a [PR to the main `will_paginate-bulma` repo](https://github.com/phoffer/will_paginate-bulma/pull/2) as well. It was a fun algorithm to work on and I'm hopeful that it will be able to benefit others looking to do a similar thing.

## In production
You can check out this app in the wild at https://www.musiclikeyoumeanit.com, and if you happen to also be interested in heavy music production you might even enjoy watching some of the videos!
