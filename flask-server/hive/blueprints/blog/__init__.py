from .views import blog

from .tables import tags

# auto-import
import os
import importlib

current_dir = os.path.dirname(os.path.abspath(__file__))
for (root, dir_names, file_names) in os.walk(current_dir):
    if root.split('/')[-1] == 'models':
        for file_name in file_names:
            _file = file_name.split('.')[0]

            _class = ''
            for word in _file.split('_'):
                new_word = word[0].upper() + word[1:]
                _class += new_word

            model_path = 'hive.blueprints.blog.models.{}'.format(_file)
            print(getattr(importlib.import_module(model_path), _class))

#from .models.post import Post
#from .models.category import Category
#from .models.tag import Tag
#from .models.post_revision import PostRevision
