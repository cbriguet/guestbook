import textwrap

#Class for storing Feedbacks with date and source.

class Feedback(object):

    def __init__(self, name, picUrl, date, comment):
        self.name = name
        self.picUrl = picUrl
        self.date = date
        self.comment = comment
        
    # def __str__(self):
    #     return "{}\n{}\n{}\n{}".format(
    #         self.name, self.picUrl, self.date.strftime('%B %d, %Y'), self.comment)