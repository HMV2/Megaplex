from itertools import count
from django.db import models

# Create your models here.
from django.db import models
from django.contrib.auth.models import User
from django.db.models import Max

# Create your models here.
class Chat_Message(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='user')
	sender = models.ForeignKey(User, on_delete=models.CASCADE, related_name='from_user')
	recipient = models.ForeignKey(User, on_delete=models.CASCADE, related_name='to_user')
	body = models.TextField(max_length=1000, blank=True, null=True)
	date = models.DateTimeField(auto_now_add=True)
	is_read = models.BooleanField(default=False)

	def send_message(from_user, to_user, body):
		sender_message = Chat_Message(
			user=from_user,
			sender=from_user,
			recipient=to_user,
			body=body,
			is_read=True)
		sender_message.save()

		recipient_message = Chat_Message(
			user=to_user,
			sender=from_user,
			body=body,
			recipient=from_user)
		recipient_message.save()
		return sender_message

	def get_messages(user):
		messages = Chat_Message.objects.filter(user=user).values('recipient').annotate(last=Max('date')).order_by('-last')
		users = []
		for message in messages:
			users.append({
				'user': User.objects.get(pk=message['recipient']),
				'last': message['last'],
				'unread': Chat_Message.objects.filter(user=user, recipient__pk=message['recipient'], is_read=False).count()
				})
		return users

	def get_unread(user):
		messages =Chat_Message.objects.filter(user=user).values('recipient').annotate(last=Max('date')).order_by('-last')
		count = 0
		for message in messages:
			count += Chat_Message.objects.filter(user=user, recipient__pk=message['recipient'], is_read=False).count()
		# for i in messages:
		# 	if not i.is_read:
		# 		count += 1
		return count