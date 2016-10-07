Hey! This is my first post at my blog.

This blog will be used for exploring how I develop software applications, documenting my discoveries, and sharing them with interested parties.

You may be interested to know that the source-code for this post looks a little like this!

<!--?prettify lang=html?-->
```
{% block body %}
    {{ post.body|markdown }}
{% endblock %}
```

That's a lot accomplished for three little lines. :)

Formatted Python code looks like this:

<!--?prettify lang=python?-->
```
def foo():
    return 'bar'

if __name__ == '__main__':
    acme = foo()    # returns 'bar'
    if not acme:
        print(False)
    else:
        print(True)
```

Cheers, Michael.
