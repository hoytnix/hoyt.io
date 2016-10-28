import re

import unidecode

_punct_re = re.compile(r'[\t !"#$%&\'()*\-/<=>?@\[\\\]^_`{|},.]+')


def slugify(text, delim=u'-'):
    """Return an ASCII-only slug.

    Taken from FlaskBB. <@shanks>

    :param text: Text to slugify.
    :param delim: Default '-'. Delimiter for whitespace.
    """

    text = text.replace('.', '')
    text = unidecode.unidecode(text)
    result = []
    for word in _punct_re.split(text.lower()):
        result.append(word)
    return delim.join(result)
