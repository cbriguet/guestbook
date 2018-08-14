#!/usr/bin/env python3
import scripts.guest_feedback
import sphc
from datetime import datetime
import os

__location__ = os.path.realpath(
    os.path.join(os.getcwd(), os.path.dirname(__file__)))

#*****Amount of airbnb reviews*************

client_id = "" #Client id from api url
listing_id = "" #Listing id from api url
number = 0 #max 100
offset = 100 #what number review to start from, for instance 2 will start from the second review


#******************************************

tf = sphc.TagFactory()
header = tf.H1("Airbnb Guest Book")
doc = tf.HTML()
doc.header=header
doc.body = tf.BODY()
doc.body.content = tf.H3("For listing: "+listing_id)
atable = tf.TABLE(border="0",cellspacing="10")

feedbacks = scripts.guest_feedback.get_airbnb_feedback(client_id, listing_id, number, offset)
now = datetime.now().strftime("%d-%m-%Y")

with open(os.path.join(__location__, "guestbook-{}".format(str(now)))+"-"+str(offset)+"to"+str(offset+number)+".html", "w+") as file:

	for review in feedbacks:	

		row = tf.TR()
		imgtag = tf.IMG(src=review['url'], height="100", width="100")
		#print (review['date'].strftime('%B-%d-%Y'))

		row.cells = [tf.TD(imgtag), tf.TD(review['date'].strftime('%B %d %Y')),tf.TD(review['name']),tf.TD(review['comments'])]
		
		atable.row = row

	doc.body.content = atable
	#print (doc)
	file.write(str(doc))
file.close()
