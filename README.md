# guestbook
Guestbook generator for Airbnb listing

This Python script can be used to create automatically a guesbook from all the public reviews of a given Airbnb listing


## Prerequisites


requests -> pip install requests

sphc -> pip install sphc 
Note for Python3 users, if you enconter an "NameError: name 'basestring' is not defined", add the following code at the begining of the file /usr/local/lib/python3.7/site-packages/sphc/__init__.py

```
try:
  basestring
except NameError:
  basestring = str
```


## Configuration

Edit the guestbook.command file

to get your client_id go the the Dashboard page, open the developer tools from Chrome, and search for the client_id string.

to get get your listing id go to Manage Listing, select Preview My Listing and look at the url. There will be a number after /rooms and before the next bit of text. That is your listing_id number.

```
client_id = "" #Client id from api url
listing_id = "" #Listing id from api url
number = 100 #max 100
offset = 0 #what number review to start from, for instance 2 will start from the second review
```

## Usage example

From the guesbook repo
```
./guestbook.command
```

## Acknowledgments

* Inspired from https://github.com/hyperdemon/HelpXWorkawayAirbnbReviewScraper

