# Item-based Modules

This repository contains a number of Dynamicweb modules implemented using items.

**Note**: Requires [Dynamicweb 8.3.0.1 (or later)](http://developer.dynamicweb-cms.com/downloads/dynamicweb-8.aspx)

## Blog

A simple blog module with blog posts and comments.

## Calendar

A simple calendar module with a fancy jQuery display on top.

## News

A simple news module with news items.


## Installation

The repository contains a number of items types (xml files) and an
example design using the item types.

After installing items and templates (see below) you can restore an
example database (from the zip archive
[database/itembasedmodules.bak.zip](database/itembasedmodules.bak.zip]) or [create content manually](#usage).


### Items

Copy all xml files from the [Files/System/Items/](Files/System/Items/)
folder into the Files/System/Items/ folder of your running Dynamicweb
solution. This will add the item types (including one for website
settings used by the example layout).


### Templates

Copy the design folder
[Files/Templates/Designs/itembasedmodules/](Files/Templates/Designs/itembasedmodules/) into the
Designs folder of your solution.

## Usage

Follow these steps to set up a _Blog_

* Create a page of type _Blog_
* Add an Item Publisher publishing _Blog Posts_ to the page. Use _Select items under the current page_ under _Select items from_.
* Add _Blog Posts_ as subpages

### Item page layouts

If you've installed the example templates, you can use the provided item page layouts for your items:

* Edit your website and go to Layout > Item page layouts
* Use the _Blog.cshtml_ layout template for _Blog_ items
* Use the _Blog_Post.cshtml_ layout template for _Blog Post_ items

Calendar and News work just the same: create an item page, add an item publishing and create subpages.
