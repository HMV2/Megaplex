from django.core import validators
from django.db import models


class Category(models.Model):
    Name = models.CharField(max_length=120, null=False, validators=[validators.MinLengthValidator(2)], db_index=True)
    Description = models.CharField(max_length=60, validators=[validators.MinLengthValidator(30)])
    Image = models.ImageField(upload_to="static/uploads/category")

    def __str__(self):
        return self.Name
