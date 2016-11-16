# pylint: disable=unused-import
from flask_wtf import Form
from wtforms import (SelectField, StringField, TextAreaField, BooleanField,
                     IntegerField, FloatField, DateTimeField)
from wtforms.validators import (DataRequired, Length, Optional, Regexp,
                                NumberRange)
from wtforms_alchemy import Unique

from lib.util_wtforms import ModelForm


class PostForm(ModelForm):
    body = TextAreaField('Body')