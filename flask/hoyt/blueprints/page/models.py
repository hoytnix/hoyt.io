from hoyt.extensions import db

class Obj:
    def __str__(self):
        return '\n'.join('{} => {}'.format(k, self.__dict__[k]) for k in self.__dict__)

class Attribute(db.Model):
    __tablename__ = 'attributes'  # plural lower-case
    id = db.Column(db.Integer, primary_key=True)

    # Details.
    request = db.Column(db.Text, nullable=False)
    key = db.Column(db.Text, nullable=False)
    value = db.Column(db.Text, nullable=False)

    @classmethod
    def attribute_dict(cls, request):
        o = Obj()
        for row in Attribute.query.filter_by(request=request).all():
            o.__dict__[row.key] = row.value
        return o
